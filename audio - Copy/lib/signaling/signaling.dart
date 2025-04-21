import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signaling {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String roomId;
  RTCPeerConnection? peerConnection;
  MediaStream? localStream;

  Signaling({required this.roomId});

  Future<MediaStream> initStream({bool isVideo = false}) async {
    localStream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': isVideo,
    });
    return localStream!;
  }

  Future<RTCPeerConnection> createPeer({bool isCaller = true}) async {
    final config = {
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ]
    };

    peerConnection = await createPeerConnection(config);

    localStream!.getTracks().forEach((track) {
      peerConnection!.addTrack(track, localStream!);
    });

    final roomRef = firestore.collection('calls').doc(roomId);
    final myCandidates = roomRef.collection(isCaller ? 'callerCandidates' : 'receiverCandidates');

    peerConnection!.onIceCandidate = (candidate) {
      if (candidate != null) {
        myCandidates.add({
          'candidate': candidate.candidate,
          'sdpMid': candidate.sdpMid,
          'sdpMLineIndex': candidate.sdpMLineIndex,
        });
      }
    };

    final remoteCandidates = roomRef.collection(isCaller ? 'receiverCandidates' : 'callerCandidates');
    remoteCandidates.snapshots().listen((snapshot) {
      for (var doc in snapshot.docChanges) {
        if (doc.type == DocumentChangeType.added) {
          final data = doc.doc.data()!;
          peerConnection!.addCandidate(RTCIceCandidate(
            data['candidate'],
            data['sdpMid'],
            data['sdpMLineIndex'],
          ));
        }
      }
    });

    return peerConnection!;
  }

  Future<void> createOffer() async {
    final roomRef = firestore.collection('calls').doc(roomId);
    final offer = await peerConnection!.createOffer();
    await peerConnection!.setLocalDescription(offer);

    await roomRef.set({'offer': offer.toMap()});

    roomRef.snapshots().listen((snapshot) async {
      final data = snapshot.data();
      if (data?['answer'] != null) {
        final answer = data!['answer'];
        await peerConnection!.setRemoteDescription(
          RTCSessionDescription(answer['sdp'], answer['type']),
        );
      }
    });
  }

  Future<void> joinOffer() async {
    final roomRef = firestore.collection('calls').doc(roomId);
    final roomData = await roomRef.get();

    final offer = roomData.data()!['offer'];
    await peerConnection!.setRemoteDescription(
      RTCSessionDescription(offer['sdp'], offer['type']),
    );

    final answer = await peerConnection!.createAnswer();
    await peerConnection!.setLocalDescription(answer);
    await roomRef.update({'answer': answer.toMap()});
  }
}