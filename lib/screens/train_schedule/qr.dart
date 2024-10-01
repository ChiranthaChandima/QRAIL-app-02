// file path: /lib/screens/qr_screen.dart

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrail_fp/data/train.dart';

class QrScreen2 extends StatelessWidget {
  final TrainItem data;

  const QrScreen2({super.key, required this.data});

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
