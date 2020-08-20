import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book your trip'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/road.jpg'),
            fit: BoxFit.cover,
          )),
          child: StreamBuilder(
            stream: Firestore.instance.collection('schedule').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('Loading data please wait');
              }
              var userDocument = snapshot.data.documents[0];
              return ListView(
                children: [
                  Text(userDocument['day']),
                  Text(userDocument['departure']),
                  Text(userDocument['destination']),
                  Text(userDocument['time']),
                ],
              );

              /* return Column(
                children: [
                  Text(snapshot.data.documents[0]['day']),
                  Text(snapshot.data.documents[0]['departure']),
                  Text(snapshot.data.documents[0]['destination']),
                  Text(snapshot.data.documents[1]['time']),
                ],
              );*/
              /*return DataTable(
                  columnSpacing: 25.0,
                  columns: [
                    DataColumn(
                        label: Text('Day'),
                        numeric: false,
                        tooltip: 'This is the day of the week'),
                    DataColumn(
                        label: Text('Departure'),
                        numeric: false,
                        tooltip: 'This is  the departure point'),
                    DataColumn(
                        label: Text('Destination'),
                        numeric: false,
                        tooltip: 'This is the destination'),
                    DataColumn(
                        label: Text('Time'),
                        numeric: false,
                        tooltip: 'This is the time of departure'),
                  ],
                  rows: null);*/
            },
          )),
    );
  }
}
