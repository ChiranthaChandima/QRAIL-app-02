import 'package:flutter/material.dart';
import 'package:qrail_fp/screens/train_schedule/checkout.dart';


class TrainDetailsScreen extends StatelessWidget {
  final String? startStation;
  final String? endStation;
  // final String startStationName;
  // final String endStationName;

  const TrainDetailsScreen({
    super.key,
    required this.startStation,
    required this.endStation,
    // required this.startStationName,
    // required this.endStationName,
  });

  @override
  Widget build(BuildContext context) {
    // Sample placeholder data, replace with real train data
    final trainDetails = [
      {"name": "Express Train", "time": "10:00 AM", "price": "20.00"},
      {"name": "Fast Train", "time": "12:00 PM", "price": "25.00"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Train Details'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: trainDetails.length,
        itemBuilder: (context, index) {
          final train = trainDetails[index];
          return Card(
            child: ListTile(
              title: Text("${train['name']} - ${train['time']}"),
              subtitle: Text("Price: Rs${train['price']}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(
                      startStation: startStation,
                      endStation: endStation,
                      train: train,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
