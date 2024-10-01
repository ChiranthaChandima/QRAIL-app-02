import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrail_fp/data/schedule_data.dart';
import 'package:qrail_fp/screens/ticket_view/ticket_detail.dart';
import 'package:qrail_fp/screens/widgets/schedule_card.dart';
import 'package:qrail_fp/screens/widgets/show_up_animation.dart';
import 'package:qrail_fp/screens/widgets/text.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({super.key});

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          child: Column(
            children: const [
              CustomAppBar(),
              Expanded(
                child: HomeBody(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Yudeesha',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // "My Bookings" title
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center, // Center the text
          child: TextUtil(
            text: "My Bookings",
            color: Colors.blueGrey,
            weight: true,
            size: 28,
          ),
        ),
        // Expanded list of schedule cards
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 227, 227, 227), // Background color
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
            ),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: scheduleList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ShowUpAnimation(
                        delay: 150 * index,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  data: scheduleList[index],
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 4, // Add elevation to make it look like a card
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero, // Remove rounded corners
                            ),
                            color: Colors.transparent, // Set background color to transparent
                            child: ScheduleCard(
                              data: scheduleList[index],
                              index: index,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing between the cards
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
