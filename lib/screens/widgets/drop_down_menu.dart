// import 'package:flutter/material.dart';
// import 'package:qrail_fp/models/station.dart';

// class DropdownMenuWidget extends StatelessWidget {
//   final List<Station> stations;
//   final Station selectedStation;
//   final Function(Station?) onChanged; // Accept nullable Station argument

//   DropdownMenuWidget({
//     required this.stations,
//     required this.selectedStation,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<Station>(
//       value: selectedStation,
//       onChanged: (Station? value) =>
//           onChanged(value), // Pass nullable value to onChanged
//       items: stations.map<DropdownMenuItem<Station>>((Station station) {
//         return DropdownMenuItem<Station>(
//           value: station,
//           child: Text(station.stationName),
//         );
//       }).toList(),
//       decoration: InputDecoration(
//         labelText: 'Select Station',
//         suffixIcon: Icon(Icons.arrow_drop_down),
//         border: OutlineInputBorder(),
//       ),
//     );
//   }
// }
