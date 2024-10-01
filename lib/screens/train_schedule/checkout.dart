// file path: /lib/screens/checkout_screen.dart

import 'package:flutter/material.dart';
import 'package:qrail_fp/data/train.dart';
// import 'package:qrail_fp/data/train.dart';
import 'package:qrail_fp/screens/train_schedule/qr.dart';

class CheckoutScreen extends StatefulWidget {
  final String? startStation;
  final String? endStation;
  // final String startStationName;
  // final String endStationName;
  final Map<String, String> train;

  const CheckoutScreen(
      {super.key,
      required this.startStation,
      required this.endStation,
      //   required this.startStationName,
      // required this.endStationName,
      required this.train});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String process = "Pay";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(30), bottom: Radius.circular(20))),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetails(),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (process == "Pay") {
                    setState(() {
                      process = "Loading";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QrScreen2(
                              data: TrainItem(
                                trainName: widget.train["name"]!,
                                date: "2024-01-01", // Replace with real date
                                startTime: widget.train["time"]!,
                                price: widget.train["price"]!,

                               ),
                              ),
                        ),
                      );
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(15),
                ),
                child: process == "Pay"
                    ? const Text("Pay Now",
                        style: TextStyle(fontSize: 17, color: Colors.black))
                    : process == "Loading"
                        ? const CircularProgressIndicator(color: Colors.black)
                        : const Text("Ticket Purchase"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      children: [
        ListTile(
          title: Text("From: ${widget.startStation}"),
          subtitle: Text("To: ${widget.endStation}"),
        ),
        ListTile(
          title: Text("Train: ${widget.train['name']}"),
          subtitle: Text("Time: ${widget.train['time']}"),
        ),
        ListTile(
          title: const Text("Total Price"),
          subtitle: Text("Rs${widget.train['price']}"),
        ),
      ],
    );
  }
}
