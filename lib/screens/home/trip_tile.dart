import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_express/models/tript.dart';

class TripTile extends StatelessWidget {
  final Tripd trip;
  TripTile({this.trip});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          color: Colors.blue[100],
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              ListTile(
                leading: Text(
                  'Account',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ListTile(
                leading: Text(
                  ' Name: ${trip.name}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ListTile(
                leading: Text(
                  'Number: ${trip.number}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ListTile(
                leading: Text(
                  'Email: ${trip.email}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
