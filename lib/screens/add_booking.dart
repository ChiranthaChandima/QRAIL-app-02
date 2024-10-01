// //import 'dart:ffi';
// import 'package:customizable_counter/customizable_counter.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:qrail_fp/services/login_services.dart';
// import 'package:qrail_fp/models/station.dart';
// import 'package:qrail_fp/project/screens/widgets/drop_down_menu.dart';

// //import 'package:google_fonts/google_fonts.dart';
// class Bookingpage extends StatefulWidget {
//   const Bookingpage({super.key});
//   @override
//   State<Bookingpage> createState() => _BookingpageState();
// }

// class _BookingpageState extends State<Bookingpage> {
//   late Station selectedStation; // Change selectedStation type to Station
//   late Future<List<Station>> stations; // Change stations type to List<Station>

//   @override
//   void initState() {
//     super.initState();
//     // stations = fetchStations();
//     // selectedStation =
//     //     Station(id: '', stationName: ''); // Initialize with an empty station
//   }

//   // Future<List<Station>> fetchStations() async {
//   //   try {
//   //     final apiService = APIServices();
//   //     final fetchedStations = await apiService.fetchStation();
//   //     return fetchedStations;
//   //   } catch (e) {
//   //     print('Error occured while getting the data from server: $e');
//   //   }
//   // }

//   Map userData = {};
//   final _formkey = GlobalKey<FormState>();

//   TextEditingController _dateController = TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar:
//             AppBar(title: const Text('Make a Reservation'), centerTitle: true),
//         body: Form(
//           key: _formkey,
//           child: Container(
//             margin: const EdgeInsets.all(24),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[_inputField(context)],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _inputField(context) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           TextFormField(
//             obscureText: true,
//             decoration: InputDecoration(
//               labelText: 'From',
//               suffixIcon: Icon(Icons.train),
//               hintText: 'KUMBAKONAM',
//             ),
//           ),
//           TextFormField(
//             decoration: InputDecoration(
//               labelText: 'To',
//               suffixIcon: Icon(Icons.train),
//               hintText: 'THANJAVUR',
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               // Handle the search train action
//             },
//             child: Text('SEARCH TRAIN'),
//           ),
//           SizedBox(height: 20),
//           TextFormField(
//             decoration: InputDecoration(
//               labelText: 'Train No. / Train Name',
//               suffixIcon: Icon(Icons.search),
//             ),
//           ),
//           SizedBox(height: 20),

//           // FutureBuilder<List<Station>>(
//           //   future: stations,
//           //   builder: (context, snapshot) {
//           //     if (snapshot.connectionState == ConnectionState.waiting) {
//           //       return CircularProgressIndicator(); // Placeholder while fetching data
//           //     } else if (snapshot.hasError) {
//           //       return Text('Error: ${snapshot.error}');
//           //     } else {
//           //       return DropdownMenuWidget(
//           //         stations: snapshot.data ?? [],
//           //         selectedStation: selectedStation,
//           //         onChanged: (Station? value) {
//           //           // Accept nullable Station argument
//           //           // Change parameter type to Station
//           //           if (value != null) {
//           //             setState(() {
//           //               selectedStation = value;
//           //             });
//           //           }
//           //         },
//           //       );
//           //     }
//           //   },
//           // ),

//           TextField(
//             controller: _dateController,
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Icons.calendar_today),
//             ),
//             onTap: () {
//               _dateSeleted();
//             },
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             "Passenger Count",
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           CustomizableCounter(
//             textColor: Colors.black,
//             count: 0,
//             step: 1,
//             minCount: 0,
//             maxCount: 10,
//             incrementIcon: const Icon(
//               Icons.add,
//               color: Colors.black,
//             ),
//             decrementIcon: const Icon(
//               Icons.remove,
//               color: Colors.black,
//             ),
//             onCountChange: (count) {},
//             onIncrement: (count) {},
//             onDecrement: (count) {},
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           // ElevatedButton.icon(
//           //   icon: Icon(
//           //     Icons.search,
//           //     color: Colors.white,
//           //   ),
//           //   onPressed: () async {
//           //     await aps.getStations();
//           //   },
//           // onPressed: () {
//           //   if (_formkey.currentState!.validate()) {
//           //     ScaffoldMessenger.of(context).showSnackBar(
//           //       SnackBar(content: Text('Searching')),
//           //     );
//           //   }
//           // },
//           // label: Text(
//           //   'Search Train',
//           //   style: TextStyle(fontSize: 17),
//           // ),
//           // style: ElevatedButton.styleFrom(
//           //     shape: RoundedRectangleBorder(
//           //       borderRadius: BorderRadius.circular(50.0),
//           //     ),
//           //     padding: EdgeInsets.all(10.0)),
//           // ),
//         ],
//       ),
//     );
//   }

//   void _dateSeleted() async {
//     DateTime? date = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );

//     if (date != null) {
//       setState(() {
//         _dateController.text = date.toString().split(" ")[0];
//       });
//     }
//   }
// }
