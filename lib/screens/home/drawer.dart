import 'package:flutter/material.dart';
//import 'package:travel_express/models/tript.dart';
import 'package:travel_express/screens/home/account.dart';
import 'package:travel_express/screens/home/schedule.dart';
import 'package:travel_express/screens/home/trips.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Musinguzi Denis'),
            accountEmail: Text('denis@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/allianz.jpg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Account'),
            subtitle: Text('Edit your profile'),
            trailing: Icon(Icons.edit),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Account()));
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_bus),
            title: Text('Trip'),
            subtitle: Text('Available Routes'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Trip()));
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_bus),
            title: Text('Schedules'),
            subtitle: Text('See timetable'),
            trailing: Icon(Icons.calendar_today),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Schedule()));
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            subtitle: Text('See your last trips'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
