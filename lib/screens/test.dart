// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qrail_fp/api/api.services.dart';

// import '../../models/station.dart';

// class test extends StatelessWidget {
//   APIServices se = new APIServices();
//   List<Station> station = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: FutureBuilder(
//             future: se.getStations(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) return CircularProgressIndicator();
//               if (snapshot.hasError) return Text("Error");
//               if (snapshot.hasData) {
//                 return Column(
//                   children: [...snapshot.data!.map((e) => Text(e.stationName))],
//                 );
//               }
//               return Text("No data available.");
//             }),
//       )),
//     );
    
//   }
// }
