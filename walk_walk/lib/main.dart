import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(WalkingApp());
}

class WalkingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalkingScreen(),
    );
  }
}

class WalkingScreen extends StatefulWidget {
  @override
  _WalkingScreenState createState() => _WalkingScreenState();
}

class _WalkingScreenState extends State<WalkingScreen> {
  late Stream<StepCount> _stepCountStream;
  int _steps = 0;
  String _status = "Initializing...";

  @override
  void initState() {
    super.initState();
    requestPermission();
  }


  Future<void> requestPermission() async {
    var status = await Permission.activityRecognition.request();
    if (status.isGranted) {
      setState(() {
        _status = "Permission Granted";
      });
      initStepCounter();
    } else if (status.isDenied) {
      setState(() {
        _status = "Permission Denied. please allow in settings.";
      });
    } else if (status.isPermanentlyDenied) {
      setState(() {
        _status = "Permission PermanentlyDenied.open settings to enable.";
      });
      openAppSettings();
    }
  }
  void initStepCounter() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(
          (StepCount event) {
        setState(() {
          _steps = event.steps;
        });
      },
      onError: (error) {
        setState(() {
          _status = "Error: $error";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Walking Tracker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions_walk, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              "Steps Taken: $_steps",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _status,
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
