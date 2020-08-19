//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_express/models/tript.dart';
import 'package:travel_express/services/auth.dart';
import 'package:travel_express/services/database.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_express/screens/home/trip_list.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Tripd>>.value(
      value: DatabaseService().trips,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Travel Express'),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.settings),
              label: Text('Update'),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bus.jpg'),
                  fit: BoxFit.cover)),
          child: TripList(),
        ),
      ),
    );
  }
}
