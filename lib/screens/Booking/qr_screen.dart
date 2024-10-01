// file path: /lib/screens/qr_screen.dart

import 'package:flutter/material.dart';
import 'package:qrail_fp/data/schedule_data.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatelessWidget {
  final ScheduleItem data;

  const QrScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String qrData = "${data.trainName} - ${data.date} - ${data.startTime}";

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Ticket"),
      ),
      body: Center(
        child: QrImageView(
          data: qrData,
          version: QrVersions.auto,
          size: 200.0,
          eyeStyle: const QrEyeStyle(
            eyeShape: QrEyeShape.square,
            color: Colors.blueGrey,
          ),
          dataModuleStyle: const QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
