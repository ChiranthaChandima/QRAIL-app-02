import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qrail_fp/data/fare_data.dart';
import 'package:qrail_fp/screens/train_schedule/ticket_summary.dart';

class TrainSchedule extends StatefulWidget {
  const TrainSchedule({super.key});

  @override
  State<TrainSchedule> createState() => _TrainScheduleState();
}

class _TrainScheduleState extends State<TrainSchedule> {
  final _formKey = GlobalKey<FormState>();
  String? _startStation;
  String? _endStation;
  DateTime? _selectedDate;
  int _passengerCount = 1;
  bool _payButtonEnabled = false;
  double _farePerPassenger = 0.0;

  final List<String> stationList = [
    'Colombo',
    'Kelaniya',
    'Gampaha',
    'Ragama',
    'Kandy',
    'Hunupitiya',
    'Galle',
    'Polgahawela',
    'Weyangoda'
  ];

  void _updateFare() {
    setState(() {
      if (_startStation != null &&
          _endStation != null &&
          _startStation != _endStation) {
        _farePerPassenger = fareData[_startStation]![_endStation] ?? 0.0;
        _payButtonEnabled = true;
      } else {
        _farePerPassenger = 0.0;
        _payButtonEnabled = false;
      }
    });
  }

  void _incrementPassenger() {
    setState(() {
      _passengerCount++;
      _updateFare();
    });
  }

  void _decrementPassenger() {
    if (_passengerCount > 1) {
      setState(() {
        _passengerCount--;
        _updateFare();
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blueGrey,
            colorScheme: ColorScheme.light(primary: Colors.blueGrey),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Buy Tickets',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF1c50d0),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _buildFormCard(),
                const SizedBox(height: 30.0),
                _buildPayButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Buy Tickets',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 25.0),
            _buildStationDropdown(
              label: 'From',
              value: _startStation,
              onChanged: (value) {
                setState(() {
                  _startStation = value;
                  _updateFare();
                });
              },
            ),
            const SizedBox(height: 20.0),
            _buildStationDropdown(
              label: 'To',
              value: _endStation,
              onChanged: (value) {
                setState(() {
                  _endStation = value;
                  _updateFare();
                });
              },
            ),
            const SizedBox(height: 20.0),
            _buildDatePicker(),
            const SizedBox(height: 25.0),
            _buildPassengerCounter(),
          ],
        ),
      ),
    );
  }

  Widget _buildStationDropdown({
    required String label,
    String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: stationList.map((station) {
        return DropdownMenuItem<String>(
          value: station,
          child: Text(station),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          Icons.train,
          color: Colors.blueGrey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: onChanged,
      validator: (value) =>
          value == null ? 'Please select a $label station' : null,
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      iconEnabledColor: Colors.blueGrey,
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Travel Date',
            prefixIcon: Icon(
              Icons.calendar_today,
              color: Colors.blueGrey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          validator: (value) {
            if (_selectedDate == null) {
              return 'Please select a travel date';
            }
            return null;
          },
          controller: TextEditingController(
            text: _selectedDate != null
                ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                : '',
          ),
        ),
      ),
    );
  }

  Widget _buildPassengerCounter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Passengers',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            IconButton(
              onPressed: _decrementPassenger,
              icon: const Icon(Icons.remove_circle_outline),
              color: Colors.blueGrey,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '$_passengerCount',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            IconButton(
              onPressed: _incrementPassenger,
              icon: const Icon(Icons.add_circle_outline),
              color: Colors.blueGrey,
            ),
            const SizedBox(width: 10.0),
            const Icon(Icons.person, color: Colors.blueGrey),
            const SizedBox(width: 5.0),
            const Text(
              'Passenger',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPayButton() {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 60, // Increased height for better visibility
        child: ElevatedButton(
          onPressed: _payButtonEnabled
              ? () {
                  if (_formKey.currentState!.validate()) {
                    double totalFare = _farePerPassenger * _passengerCount;

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TicketSummaryPage(
                          fromStation: _startStation ?? '',
                          toStation: _endStation ?? '',
                          travelDate: _selectedDate != null
                              ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                              : '',
                          passengerCount: _passengerCount,
                          totalCost: totalFare,
                        ),
                      ),
                    );
                  }
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1c50d0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
          ),
          child: Text(
            'Pay | Rs. ${_farePerPassenger * _passengerCount}',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
