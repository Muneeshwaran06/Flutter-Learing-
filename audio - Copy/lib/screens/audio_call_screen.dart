import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import '../signaling/signaling.dart';

class AudioCallScreen extends StatefulWidget {
  const AudioCallScreen({Key? key}) : super(key: key);

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  final localRenderer = RTCVideoRenderer();
  final String roomId = 'myAudioRoom';
  late Signaling signaling;

  @override
  void initState() {
    super.initState();
    signaling = Signaling(roomId: roomId);
    initRenderer();
  }

  Future<void> initRenderer() async {
    await localRenderer.initialize();
  }

  Future<void> startCall() async {
    final stream = await signaling.initStream(isVideo: false);
    localRenderer.srcObject = stream;
    await signaling.createPeer(isCaller: true);
    await signaling.createOffer();
  }

  Future<void> joinCall() async {
    final stream = await signaling.initStream(isVideo: false);
    localRenderer.srcObject = stream;
    await signaling.createPeer(isCaller: false);
    await signaling.joinOffer();
  }

  @override
  void dispose() {
    localRenderer.dispose();
    signaling.peerConnection?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Call')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.mic, size: 80),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: startCall, child: const Text('Make Call')),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: joinCall, child: const Text('Join Call')),
        ],
      ),
    );
  }
}