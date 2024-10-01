import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('Train Schedule'), centerTitle: true),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[BookingScreen()],
          ),
        ),
      ),
    ));
  }
}

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int travellersCount = 1;
  DateTime selectedDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Header image with text
            const Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Text(
                  'Welcome to Sri Lanka Railways',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  // From Station input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'From',
                      suffixIcon: Icon(Icons.train),
                    ),
                  ),
                  // To Station input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'To',
                      suffixIcon: Icon(Icons.train),
                    ),
                  ),
                  // Journey Date picker
                  ListTile(
                    title: const Text('Journey Date'),
                    subtitle:
                        Text(DateFormat('dd-MMM-yyyy').format(selectedDate)),
                    trailing: const Icon(Icons.calendar_today),
                    // onTap: () => _selectDate(context),
                  ),
                  // Travellers counter
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     Text('Travellers'),
                  //     Row(
                  //       children: <Widget>[
                  //         IconButton(
                  //           icon: Icon(Icons.remove),
                  //           onPressed: () {
                  //             setState(() {
                  //               if (travellersCount > 1) travellersCount--;
                  //             });
                  //           },
                  //         ),
                  //         Text('$travellersCount'),
                  //         IconButton(
                  //           icon: Icon(Icons.add),
                  //           onPressed: () {
                  //             setState(() {
                  //               travellersCount++;
                  //             });
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 20),
                  // Search button
                  ElevatedButton(
                    onPressed: () {
                      // Implement search functionality
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity,
                          50), // double.infinity is the width and 50 is the height
                    ),
                    child: const Text('Search'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
