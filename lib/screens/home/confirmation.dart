import 'package:flutter/material.dart';
import 'package:travel_express/models/tript.dart';
import 'package:travel_express/models/user.dart';
import 'package:travel_express/screens/home/confirmation_list.dart';
import 'package:travel_express/services/database.dart';
import 'package:provider/provider.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamProvider<List<Journeys>>.value(
      value: DatabaseServices().journeys,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Ticket'),
            backgroundColor: Colors.blue[400],
            elevation: 0.0,
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/road.jpg'),
              fit: BoxFit.cover,
            )),
            child: ConfirmationList(),
          )),
    );
  }
}
