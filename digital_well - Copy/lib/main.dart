import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const HealthApp());
}

class HealthApp extends StatelessWidget {
  const HealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Tracker',
      home: const HealthDataScreen(),
    );
  }
}

class HealthDataScreen extends StatefulWidget {
  const HealthDataScreen({super.key});

  @override
  _HealthDataScreenState createState() => _HealthDataScreenState();
}

class _HealthDataScreenState extends State<HealthDataScreen> {
  final Health health = Health();
  int? steps;
  double? heartRate;

  // NEW: Request permissions
  Future<void> requestPermissions() async {
    if (await Permission.activityRecognition.request().isGranted) {
      print("Activity recognition permission granted");
    } else {
      print("Activity recognition permission denied");
    }

    if (await Permission.sensors.request().isGranted) {
      print("Sensors permission granted");
    } else {
      print("Sensors permission denied");
    }
  }

  // Fetch health data
  Future<void> fetchHealthData() async {
    final types = [HealthDataType.STEPS, HealthDataType.HEART_RATE];
    final permissions = [HealthDataAccess.READ, HealthDataAccess.READ];

    bool granted = await health.requestAuthorization(types, permissions: permissions);

    if (granted) {
      final now = DateTime.now();
      final yesterday = now.subtract(const Duration(days: 1));

      List<HealthDataPoint> data =
      await health.getHealthDataFromTypes(startTime: yesterday, endTime: now, types: types);

      int totalSteps = 0;
      double latestHR = 0;

      for (var point in data) {
        if (point.type == HealthDataType.STEPS) {
          totalSteps += (point.value as num).toInt();
        } else if (point.type == HealthDataType.HEART_RATE) {
          latestHR = (point.value as num).toDouble();
        }
      }

      setState(() {
        steps = totalSteps;
        heartRate = latestHR;
      });
    } else {
      print("Permissions not granted");
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();
    fetchHealthData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Health Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Steps (Last 24h): ${steps ?? 'Loading...'}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text(
              "Latest Heart Rate: ${heartRate?.toStringAsFixed(1) ?? 'Loading...'} bpm",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: fetchHealthData, child: const Text("Refresh Data")),
          ],
        ),
      ),
    );
  }
}