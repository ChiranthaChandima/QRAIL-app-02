// file path: /lib/screens/checkout_screen.dart

import 'package:flutter/material.dart';
import 'package:qrail_fp/data/schedule_data.dart';
import 'package:qrail_fp/screens/Booking/qr_screen.dart';
import 'package:qrail_fp/screens/widgets/show_up_animation.dart';
import 'package:qrail_fp/screens/widgets/text.dart';

class CheckoutScreen extends StatefulWidget {
  final ScheduleItem train; // Updated type

  const CheckoutScreen({super.key, required this.train});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String process = "Pay";

  @override
  Widget build(BuildContext context) {
    final train = widget.train;

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
              ShowUpAnimation(
                delay: 200,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  Icons.train,
                                  size: 35,
                                  color: Colors.blueGrey,
                                ),
                                const SizedBox(
                                  height: 30,
                                  width: 30,
                                ),
                                TextUtil(
                                  text: "Total Price",
                                  size: 14,
                                ),
                                TextUtil(
                                  text: " ${train.price}",
                                  size: 22,
                                  weight: true,
                                  color: Colors.blueGrey,
                                ),
                              ],
                            ),
                            Transform.rotate(
                              angle: 0.3,
                              child: const SizedBox(
                                height: 150,
                                width: 200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              TextUtil(
                                text: "Train DATE",
                                size: 12,
                              ),
                              TextUtil(
                                text: train.date,
                                size: 15,
                                weight: true,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextUtil(
                                text: "TRAIN NAME",
                                size: 12,
                              ),
                              TextUtil(
                                text: train.trainName,
                                size: 15,
                                weight: true,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        //mainAxisignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              TextUtil(
                                text: "STARTING TIME",
                                size: 12,
                              ),
                              TextUtil(
                                text: train.startTime,
                                size: 15,
                                weight: true,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextUtil(
                                text: "CLASS",
                                size: 12,
                              ),
                              TextUtil(
                                text: train.trainClass,
                                size: 15,
                                weight: true,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            height: 1,
                            child: Row(
                              children: List.generate(
                                  700 ~/ 10,
                                  (index) => Expanded(
                                        child: Container(
                                          color: index % 2 == 0
                                              ? Colors.transparent
                                              : Theme.of(context).canvasColor,
                                          height: 2,
                                        ),
                                      )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                      left: -10,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blueGrey,
                      )),
                  const Positioned(
                      right: -10,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blueGrey,
                      ))
                ],
              ),
              ShowUpAnimation(
                delay: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            process = "Load";
                            update();
                          });
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context).indicatorColor,
                              borderRadius: BorderRadius.circular(15)),
                          alignment: Alignment.center,
                          child: process == "Load"
                              ? CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                )
                              : ElevatedButton(
                                      child: Text(
                                      process == 'Pay' ? 'Pay Now' : 'Train booked',
                                      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      if (process == 'Pay') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => QrScreen(data: widget.train),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void update() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        process = "Book";
      });
    });
  }
}

