import 'package:flutter/material.dart';
import 'package:travel_express/shared/constants.dart';

class UpdateJourney extends StatefulWidget {
  @override
  _UpdateJourneyState createState() => _UpdateJourneyState();
}

class _UpdateJourneyState extends State<UpdateJourney> {
  final _formKey = GlobalKey<FormState>();
  final List<int> day = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ];
  final List<String> month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final List<int> year = [
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027,
    2028,
    2029,
    2030
  ];
  final List<String> departure = ['Kampala'];
  final List<String> destination = [
    'Mbarara Price: 20,000',
    'Fort Portal Price: 35,000',
    'Kabale Price: 50,000',
    'Kisoro Price: 50,000',
    'Masaka Price: 15,000',
    'Tororo Price: 25,000',
    'Kapchorwa Price: 40,000',
    'Soroti Price: 50,000',
    'Kitgum Price: 70,000',
    'Jinja Price: 8,000',
    'Gulu Price: 50,000',
    'Arua Price: 70,000',
    'Mubende Price: 10,000',
    'Bundibugyo Price: 40,000',
    'Kasese Price: 50,000',
    'Ibanda Price: 50,000',
    'Karuma Price: 70,000',
    'Moroto Price: 90,000',
    'Kaabong Price: 50,000'
  ];

  int _currentDay;
  String _currentMonth;
  int _currentYear;
  String _currentDeparture;
  String _currentDestination;
  String _currentTime;
  final List<String> time = ['08: 00', '12:00', '14:00', '16:00'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Book your trip',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  items: day.map((days) {
                    return DropdownMenuItem(
                      value: days,
                      child: Text('$days'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentDay = val),
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  items: month.map((months) {
                    return DropdownMenuItem(
                      value: months,
                      child: Text('$months'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentMonth = val),
                ),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  items: year.map((years) {
                    return DropdownMenuItem(
                      value: years,
                      child: Text('$years'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentYear = val),
                ),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  items: departure.map((departures) {
                    return DropdownMenuItem(
                      value: departures,
                      child: Text('$departures'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentDeparture = val),
                ),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  items: destination.map((destinations) {
                    return DropdownMenuItem(
                      value: destinations,
                      child: Text('$destinations'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentDestination = val),
                ),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  items: time.map((times) {
                    return DropdownMenuItem(
                      value: times,
                      child: Text('$times'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentTime = val),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      print(_currentDay);
                      print(_currentMonth);
                      print(_currentYear);
                      print(_currentDeparture);
                      print(_currentDestination);
                      print(_currentTime);
                    })
              ],
            ),
          )),
    );
  }
}
