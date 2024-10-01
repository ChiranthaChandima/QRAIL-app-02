import 'package:flutter/material.dart';
import 'package:qrail_fp/screens/Booking/add_booking_tab.dart';
import 'package:qrail_fp/screens/widgets/text.dart';

class AddTrainScreen extends StatelessWidget {
  const AddTrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            height: 60,
            alignment: Alignment.centerLeft,
            child: TextUtil(
              text: "Book a Train",
              color: Colors.blueGrey,
              weight: true,
              size: 28,
            ),
          ),
          Expanded(
              child: Container(
            //  padding:const  EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                color: const Color(0xFF1c50d0),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30))),
            alignment: Alignment.topCenter,
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: BookingTabBar(),
            ),
          ))
        ],
      ),
    );
  }
}
