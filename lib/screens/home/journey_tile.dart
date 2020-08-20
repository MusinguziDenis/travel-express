import 'package:flutter/material.dart';
import 'package:travel_express/models/tript.dart';

class JourneyTile extends StatelessWidget {
  final Journeys journey;
  JourneyTile({this.journey});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                  'Date: ${journey.day} \t  ${journey.month}\t  ${journey.year} '),
            ),
            ListTile(
              title:
                  Text('Trip: ${journey.departure} to ${journey.destination}'),
            ),
            ListTile(
              title: Text('Time: ${journey.time} '),
            ),
          ],
        ),
      ),
    );
  }
}
