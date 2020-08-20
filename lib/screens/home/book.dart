import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_express/models/tript.dart';
import 'package:travel_express/screens/home/journey_list.dart';
import 'package:travel_express/screens/home/update_journey.dart';
import 'package:travel_express/services/database.dart';
import 'package:provider/provider.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    void _showDialogueBox() {
      showDialog(
        barrierColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: UpdateJourney(),
          );
        },
      );
    }

    return StreamProvider<List<Journeys>>.value(
      value: DatabaseServices().journeys,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Book your trip'),
            backgroundColor: Colors.blue[400],
            elevation: 0.0,
            actions: [
              FlatButton.icon(
                  onPressed: () => _showDialogueBox(),
                  icon: Icon(Icons.update),
                  label: Text('Book'))
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/road.jpg'),
              fit: BoxFit.cover,
            )),
            child: JourneyList(),
          )),
    );
  }
}
