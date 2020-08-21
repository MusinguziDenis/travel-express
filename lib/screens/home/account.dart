import 'package:flutter/material.dart';
import 'package:travel_express/models/tript.dart';
import 'package:travel_express/screens/home/update.dart';
import 'package:travel_express/services/database.dart';
import 'package:provider/provider.dart';
import 'package:travel_express/screens/home/trip_list.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showDialogueBox() {
      showDialog(
        barrierColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: UpdateForm(),
          );
        },
      );
    }

    return StreamProvider<List<Tripd>>.value(
      value: DatabaseService().trips,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Travel Express'),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              onPressed: () => _showDialogueBox(),
              icon: Icon(Icons.settings),
              label: Text('Update'),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/mountain.jpg'),
                  fit: BoxFit.cover)),
          child: TripList(),
        ),
      ),
    );
  }
}
