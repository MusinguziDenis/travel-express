import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_express/models/tript.dart';
import 'package:travel_express/models/user.dart';
import 'package:travel_express/screens/home/confirmation.dart';
import 'package:travel_express/screens/home/update_journey.dart';
import 'package:travel_express/services/database.dart';
import 'package:travel_express/shared/loading.dart';

class JourneyTile extends StatelessWidget {
  final Journeys journey;
  JourneyTile({this.journey});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    void _showDialogueBox() {
      showDialog(
        //barrierColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: UpdateJourney(),
          );
        },
      );
    }

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
                    margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Book',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => _showDialogueBox(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Confirmation()));
                    },
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
