// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:qrail_fp/data/schedule_data.dart';

import '../widgets/show_up_animation.dart';
import '../widgets/text.dart';

class DetailScreen extends StatelessWidget {
  ScheduleItem data;
  int index;

  DetailScreen({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_outlined,
              color: Theme.of(context).canvasColor,
            )),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            height: 80,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtil(
                      text: data.trainName,
                      color: Theme.of(context).indicatorColor,
                      size: 28,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtil(
                      text: data.sourceName,
                      color: Colors.white,
                      size: 12,
                      weight: true,
                    )
                  ],
                ),
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    padding: const EdgeInsets.only(top: 4),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      children: [
                        Hero(
                          tag: "hero$index",
                          child: Icon(
                            Icons.train_outlined,
                            size: 25,
                            color: Theme.of(context).indicatorColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextUtil(
                          text: data.duration,
                          color: Colors.white,
                          size: 11,
                          weight: true,
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextUtil(
                      text: data.destination,
                      color: Theme.of(context).indicatorColor,
                      size: 28,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtil(
                      text: data.destinationName,
                      color: Colors.white,
                      size: 12,
                      weight: true,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                    const SizedBox(
                                      height: 10,
                                      child: Icon(
                                        Icons.train_outlined,
                                        size: 35,
                                      ),
                                    ),
                                    Icon(
                                      Icons.train_outlined,
                                      size: 35,
                                      color: Theme.of(context).indicatorColor,
                                    ),
                                    TextUtil(
                                      text: "Total Price",
                                      size: 12,
                                    ),
                                    TextUtil(
                                      text: " ${data.price}",
                                      size: 22,
                                      weight: true,
                                      color: Colors.blueGrey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  TextUtil(
                                    text: "TRAIN DATE",
                                    size: 12,
                                  ),
                                  TextUtil(
                                    text: data.date,
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
                                    text: data.trainName,
                                    size: 15,
                                    weight: true,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  TextUtil(
                                    text: "START TIME",
                                    size: 12,
                                  ),
                                  TextUtil(
                                    text: data.startTime,
                                    size: 15,
                                    weight: true,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  TextUtil(
                                    text: "SEAT",
                                    size: 12,
                                  ),
                                  TextUtil(
                                    text: data.trainClass,
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
                                    text: data.trainClass,
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
                                                  : Theme.of(context)
                                                      .canvasColor,
                                              height: 2,
                                            ),
                                          )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          left: -10,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.blueGrey,
                          )),
                      Positioned(
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
                        Center(
                            child: TextUtil(
                          text: "Booking Ticket",
                          color: Theme.of(context).primaryColor,
                          weight: true,
                        )),
                        Center(
                          child: SizedBox(
                            width: 280,
                            height: 100,
                            // child: Image.asset(
                            //   "assets/barcode.webp",
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
