import 'package:flutter/material.dart';
import 'package:qrail_fp/screens/Booking/add_train_booking.dart';
import 'package:qrail_fp/screens/home_pages/home_page.dart';
import 'package:qrail_fp/screens/profile_section/profile_list.dart';
import 'package:qrail_fp/screens/train_schedule/train_schedule.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int currentPageIndex = 0;

  final pages = [
    const FeaturedScreen(),
    const TrainSchedule(),
    const AddTrainScreen(),
    const ProfileSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blue, 
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white), 
            icon: Icon(Icons.home_outlined, color: Colors.black), 
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.train, color: Colors.white),
            icon: Icon(Icons.train_outlined, color: Colors.black),
            label: 'Trains',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.book_online, color: Colors.white),
            icon: Icon(Icons.book_online_outlined, color: Colors.black),
            label: 'Booking',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.white),
            icon: Icon(Icons.person_2_outlined, color: Colors.black),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
