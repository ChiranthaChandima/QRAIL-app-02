import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrail_fp/screens/train_schedule/train_schedule.dart';

class TicketSummaryPage extends StatelessWidget {
  final String fromStation;
  final String toStation;
  final String travelDate;
  final int passengerCount;
  final double totalCost;

  const TicketSummaryPage({
    super.key,
    required this.fromStation,
    required this.toStation,
    required this.travelDate,
    required this.passengerCount,
    required this.totalCost,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showTicketSummaryModal(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey, // Custom background color (purple)
        foregroundColor: Color(0xFFFFFFFF), // Custom text color (white)
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        elevation: 5, // Shadow
      ),
      child: const Text(
        "Show Ticket Summary",
        style: TextStyle(
          fontSize: 16, // Font size
          fontWeight: FontWeight.bold, // Font weight
        ),
      ),
    );
  }



  void _showTicketSummaryModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Makes the corners rounded
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.85,
          minChildSize: 0.3,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStationRow(),
                      const SizedBox(height: 16),
                      _buildTicketDetails(),
                      const SizedBox(height: 16),
                      const SizedBox(height: 16),
                      _buildConfirmButton(context),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(fromStation,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Icon(Icons.arrow_forward),
        Text(toStation,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildTicketDetails() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow('Travel Date', travelDate),
          _buildDetailRowPassenger('Passengers', passengerCount),
          const SizedBox(height: 8),
          _buildDetailRow(
              'Total Cost', 'Rs. ${totalCost.toStringAsFixed(2)}', isBold: true),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(value,
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }

  Widget _buildDetailRowPassenger(String label, int value,
      {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(value.toString(),
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showQRCodeDialog(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Confirm & Pay', style: TextStyle(fontSize: 18, color: Colors.white)),
          const SizedBox(width: 10),
          Text('Rs. ${totalCost.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }

  void _showQRCodeDialog(BuildContext context) 
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Ticket QR Code'),
          content: Container(
            width: 250,
            height: 250,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  QrImageView(
                    data: 'From: $fromStation\nTo: $toStation\nDate: $travelDate\nPassengers: $passengerCount\nTotal Cost: Rs. ${totalCost.toStringAsFixed(2)}',
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
                  const SizedBox(height: 16),
                  const Text('Scan this QR code to access your ticket details.'),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                //close all dialogs and pop to first route
                Navigator.of(context).popUntil((route) => route.isFirst);
                
                //redirect to train schedule screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const TrainSchedule(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

}
