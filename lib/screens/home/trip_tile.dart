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
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            ListTile(
              title: Text(
                'Account',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('assets/images/road.jpg'),
              ),
              trailing: Icon(Icons.edit),
              subtitle: Text('Edit profile picture'),
            ),
            SizedBox(
              height: 50.0,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                ' Name ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${trip.name}'),
            ),
            SizedBox(
              height: 50.0,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${trip.number}'),
            ),
            SizedBox(
              height: 50.0,
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'Email ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${trip.email}'),
            ),
          ],
        ));
  }
}
