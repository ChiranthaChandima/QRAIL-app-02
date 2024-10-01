import 'package:flutter/material.dart';
import 'package:qrail_fp/screens/Booking/route_screen.dart';
import 'package:qrail_fp/screens/Booking/train_screen.dart';

class BookingTabBar extends StatefulWidget {
  const BookingTabBar({super.key});

  @override
  State<BookingTabBar> createState() => _BookingTabBarState();
}

class _BookingTabBarState extends State<BookingTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _navigateToTrain() {
    if (_tabController.index != 1) {
      // Assuming "Train" tab is at index 1
      _tabController.animateTo(1);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          labelColor: Theme.of(context).indicatorColor,
          unselectedLabelColor: Theme.of(context).canvasColor,
          dividerColor: Theme.of(context).canvasColor,
          indicatorColor: Theme.of(context).indicatorColor,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Text("Route"),
            ),
            Tab(
              icon: Text("Train"),
            ),
            Tab(
              icon: Text("Checkout"),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              RouteScreen(onNavigateToTrain: _navigateToTrain),
              const TrainScreen(),
              //CheckoutScreen(train: selectedTrain),
            ],
          ),
        ),
      ],
    );
  }
}
