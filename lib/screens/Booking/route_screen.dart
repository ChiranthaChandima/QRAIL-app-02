// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qrail_fp/models/station.dart';
import 'package:qrail_fp/services/station_service.dart';
import 'package:qrail_fp/screens/widgets/field.dart';

class RouteScreen extends StatefulWidget {
  final Function onNavigateToTrain;

  const RouteScreen({super.key, required this.onNavigateToTrain});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  String? _fromStation;
  String? _toStation;
  String? _class;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _travelerController = TextEditingController();
  List<StationRequest> _stationList = [];

  bool _isFormFilled = false;

  @override
  void initState() {
    super.initState();
    _fetchStations();
    _addListeners();
  }

  Future<void> _fetchStations() async {
    try {
      List<StationRequest> stations = await StationService().fetchStations();
      setState(() {
        _stationList = stations;
      });
    } catch (e) {
      print("Failed to fetch stations: $e");
    }
  }

  void _addListeners() {
    _dateController.addListener(_updateFormStatus);
    _travelerController.addListener(_updateFormStatus);
  }

  void _updateFormStatus() {
    setState(() {
      _isFormFilled = _fromStation != null &&
          _toStation != null &&
          _class != null &&
          _dateController.text.isNotEmpty &&
          _travelerController.text.isNotEmpty;
    });
  }

  // Method to show date picker
  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.white,
            colorScheme: ColorScheme.light(primary: Colors.white),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  DateTime? _selectedDate;

  @override
  void dispose() {
    _dateController.dispose();
    _travelerController.dispose();
    super.dispose();
  }

  InputDecoration _buildInputDecoration(BuildContext context, String labelText, IconData iconData) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.blueGrey,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      prefixIcon: Icon(iconData, color: Colors.blueGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Form Container
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // From Station Dropdown
                    DropdownButtonFormField<String>(
                      value: _fromStation,
                      hint: Text(
                        "FROM",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      icon: Icon(Icons.train, color: Colors.blueGrey),
                      onChanged: (String? newValue) {
                        setState(() {
                          _fromStation = newValue;
                        });
                        _updateFormStatus();
                      },
                      items: _stationList.map((station) {
                        return DropdownMenuItem<String>(
                          value: station.id,
                          child: Text(
                            station.stationName,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      decoration: _buildInputDecoration(context, "From", Icons.train),
                      isExpanded: true,
                      validator: (value) => value == null ? 'Please select a From station' : null,
                    ),
                    SizedBox(height: 20),
                    // To Station Dropdown
                    DropdownButtonFormField<String>(
                      value: _toStation,
                      hint: Text(
                        "TO",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      icon: Icon(Icons.train, color: Colors.blueGrey),
                      onChanged: (String? newValue) {
                        setState(() {
                          _toStation = newValue;
                        });
                        _updateFormStatus();
                      },
                      items: _stationList.map((station) {
                        return DropdownMenuItem<String>(
                          value: station.id,
                          child: Text(
                            station.stationName,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      decoration: _buildInputDecoration(context, "To", Icons.train),
                      isExpanded: true,
                      validator: (value) => value == null ? 'Please select a To station' : null,
                    ),
                    SizedBox(height: 20),
                    // Date Picker
                    InkWell(
                      onTap: () => _selectDate(context),
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: _dateController,
                          decoration: _buildInputDecoration(context, "Date", Icons.calendar_today),
                          validator: (value) => value == null || value.isEmpty ? 'Please select a date' : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Travelers Field
                    Field(
                      controller: _travelerController,
                      hinttext: "Travelers",
                      icon: Icons.group,
                      readOnly: false,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter number of travelers';
                        }
                        if (int.tryParse(value) == null || int.parse(value) < 1) {
                          return 'Enter a valid number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Class Dropdown
                    DropdownButtonFormField<String>(
                      value: _class,
                      hint: Text(
                        "CLASS",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      icon: Icon(Icons.airline_seat_recline_extra, color: Colors.blueGrey),
                      onChanged: (String? newValue) {
                        setState(() {
                          _class = newValue;
                        });
                        _updateFormStatus();
                      },
                      items: <String>['First', 'Second', 'Third']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      decoration: _buildInputDecoration(context, "Class", Icons.airline_seat_recline_extra),
                      isExpanded: true,
                      validator: (value) => value == null ? 'Please select a class' : null,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            // Pay Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: _isFormFilled
                    ? () {
                        // Validate form before navigating
                        if (_validateForm()) {
                          widget.onNavigateToTrain();
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFormFilled ? Colors.blue : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Navigate to Train',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateForm() {
    if (_fromStation == null ||
        _toStation == null ||
        _class == null ||
        _dateController.text.isEmpty ||
        _travelerController.text.isEmpty) {
      // You can show a snackbar or dialog here if needed
      return false;
    }
    return true;
  }
}
