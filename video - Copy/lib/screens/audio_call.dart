import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import '../signaling/signaling.dart';

class AudioCallScreen extends StatefulWidget {
  const AudioCallScreen({super.key});

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  late Signaling _signaling;
  String? _roomId;

  @override
  void initState() {
    super.initState();
    initRenderers();
    _signaling = Signaling(roomId: _roomId ?? 'default-room');
    _initCall();
  }

  Future<void> initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  Future<void> _initCall() async {
    final stream = await _signaling.initStream();
    _localRenderer.srcObject = stream;
    // Call setup logic can be added here
  }

  void startCall() async {
    await _signaling.createPeer(isCaller: true);
    await _signaling.createOffer();
  }

  void joinCall() async {
    await _signaling.createPeer(isCaller: false);
    await _signaling.joinOffer();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
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