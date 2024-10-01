// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qrail_fp/data/schedule_data.dart';
import 'package:qrail_fp/screens/ticket_view/ticket_detail.dart';
import 'package:qrail_fp/screens/widgets/schedule_card.dart';
import 'package:qrail_fp/screens/widgets/show_up_animation.dart';
import 'package:qrail_fp/screens/widgets/text.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 60,
              alignment: Alignment.centerLeft,
              child: TextUtil(
                text: "My Bookings",
                color: Colors.blueGrey,
                weight: true,
                size: 28,
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30))),
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                    itemCount: scheduleList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ShowUpAnimation(
                          delay: 150 * index,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          data: scheduleList[index],
                                          index: index,
                                        )));
                              },
                              child: ScheduleCard(
                                data: scheduleList[index],
                                index: index,
                              )));
                    }),
              ),
            ))
          ],
          //
        ),
      ),
    );
  }
}
