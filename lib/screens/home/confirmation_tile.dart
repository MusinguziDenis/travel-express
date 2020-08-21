import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_express/models/user.dart';
import 'package:travel_express/services/database.dart';
import 'package:travel_express/shared/loading.dart';

class ConfirmationTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<JourneyData>(
        stream: DatabaseServices(uid: user.uid).journeyData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            JourneyData journeys = snapshot.data;
            return Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Card(
                    color: Colors.amber[300],
                    margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Travel Express Ltd',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                              'Date: ${journeys.day} \t  ${journeys.month}\t  ${journeys.year} '),
                        ),
                        ListTile(
                          title: Text(
                              'Trip: ${journeys.departure} to ${journeys.destination}'),
                        ),
                        ListTile(
                          title: Text('Time: ${journeys.time} '),
                        ),
                        ListTile(
                          title: Text('Payment method: Cash'),
                        ),
                        ListTile(
                          title: Text(
                              'This is your ticket.\nPresent this to the conductor.\nThank you for travelling with us'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
