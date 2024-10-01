import 'package:flutter/material.dart';
import 'package:qrail_fp/screens/widgets/text.dart';
import '../../../data/schedule_data.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleItem data;
  final int index;

  ScheduleCard({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 10, 58, 179), // Set the background color here
        borderRadius: BorderRadius.circular(15.0), // Add border radius
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding
        child: Column(
          children: [
            const Spacer(),
            Row(
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
                    ),
                  ],
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
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtil(
                      text: "DATE",
                      color: Theme.of(context).canvasColor,
                      size: 12,
                      weight: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtil(
                      text: "${data.date} ${data.startTime}",
                      color: Colors.white,
                      size: 13,
                      weight: true,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextUtil(
                      text: "Train Name",
                      color: Theme.of(context).canvasColor,
                      size: 12,
                      weight: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtil(
                      text: data.trainName,
                      color: Colors.white,
                      size: 13,
                      weight: true,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
