// file path: /lib/screens/train_screen.dart

import 'package:flutter/material.dart';
import 'package:qrail_fp/data/schedule_data.dart';
import 'package:qrail_fp/screens/Booking/check_out_screen.dart';
import 'package:qrail_fp/screens/widgets/show_up_animation.dart';
import 'package:qrail_fp/screens/widgets/text.dart';

class TrainScreen extends StatefulWidget {
  const TrainScreen({super.key});

  @override
  State<TrainScreen> createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {
  final DateTime _selectedDate = DateTime.now();
  bool isLoad = true;
  int? selectedIndex;

  void update() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isLoad = true;
      });
    });
  }

  void navigateToCheckout(BuildContext context, ScheduleItem selectedTrain) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutScreen(train: selectedTrain),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLoad
            ? Expanded(
                child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtil(
                      text: "5 Trains available",
                      color: Colors.white,
                      weight: true,
                      size: 14,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: scheduleList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ShowUpAnimation(
                                delay: 150,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                    navigateToCheckout(
                                        context, scheduleList[index]);
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        margin:
                                            const EdgeInsets.only(bottom: 15),
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: selectedIndex == index
                                                    ? Theme.of(context)
                                                        .indicatorColor
                                                    : Theme.of(context)
                                                        .canvasColor)),
                                        child: Column(
                                          children: [
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextUtil(
                                                      text: scheduleList[index]
                                                          .trainName,
                                                      color: selectedIndex ==
                                                              index
                                                          ? Theme.of(context)
                                                              .indicatorColor
                                                          : Colors.white,
                                                      size: 28,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextUtil(
                                                      text: scheduleList[index]
                                                          .sourceName,
                                                      color: Colors.white,
                                                      size: 12,
                                                      weight: true,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    TextUtil(
                                                      text: scheduleList[index]
                                                          .destination,
                                                      color: selectedIndex ==
                                                              index
                                                          ? Theme.of(context)
                                                              .indicatorColor
                                                          : Colors.white,
                                                      size: 28,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextUtil(
                                                      text: scheduleList[index]
                                                          .destinationName,
                                                      color: Colors.white,
                                                      size: 12,
                                                      weight: true,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextUtil(
                                                      text: "DATE",
                                                      color: Theme.of(context)
                                                          .canvasColor,
                                                      size: 12,
                                                      weight: true,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextUtil(
                                                      text:
                                                          "${scheduleList[index].date} ${scheduleList[index].startTime}",
                                                      color: Colors.white,
                                                      size: 13,
                                                      weight: true,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    TextUtil(
                                                      text: "TRAIN NAME",
                                                      color: Theme.of(context)
                                                          .canvasColor,
                                                      size: 12,
                                                      weight: true,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextUtil(
                                                      text: scheduleList[index]
                                                          .trainName,
                                                      color: Colors.white,
                                                      size: 13,
                                                      weight: true,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Divider(
                                              color: selectedIndex == index
                                                  ? Theme.of(context)
                                                      .indicatorColor
                                                  : Colors.white,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.credit_card,
                                                  color: selectedIndex == index
                                                      ? Theme.of(context)
                                                          .indicatorColor
                                                      : Colors.white,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: 'Ticket Price ',
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .canvasColor,
                                                        fontSize: 14),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text:
                                                            " ${scheduleList[index].price}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: selectedIndex ==
                                                                    index
                                                                ? Theme.of(
                                                                        context)
                                                                    .indicatorColor
                                                                : Colors.white,
                                                            fontSize: 17),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 40,
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          padding: const EdgeInsets.all(2),
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            height: 50,
                                            width: 50,
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.train,
                                                  size: 25,
                                                  color: selectedIndex == index
                                                      ? Theme.of(context)
                                                          .indicatorColor
                                                      : Colors.white,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                TextUtil(
                                                  text: scheduleList[index]
                                                      .duration,
                                                  color: Colors.white,
                                                  size: 11,
                                                  weight: true,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          }),
                    ),
                  ],
                ),
              ))
            : const SizedBox(),
      ],
    );
  }
}
