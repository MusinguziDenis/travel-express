import 'package:flutter/material.dart';
import 'package:travel_express/screens/home/book.dart';

class Trip extends StatefulWidget {
  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> {
  //final _formKey = GlobalKey<FormState>();
  final List<String> data = <String>[
    'Kampala to Mbarara',
    'Kampala to Mbale',
    'Kampala to Jinja',
    'Kampala to Arua',
    'Kampala to FortPortal',
    'Kampala to Rukungiri',
    'Kampala to Adjumani',
    'Kampala to Hoima',
    'Kampala to Kabale',
    'Kampala to Kasese',
    'Kampala to Soroto',
    'Kampala to Tororo',
    'Kampala to Kapchorwa',
    'Kampala to Mukono',
    'Kampala to Kagadi',
    'Kampala to Kiboga'
  ];
  final List<int> price = <int>[
    20000,
    40000,
    8000,
    50000,
    25000,
    50000,
    60000,
    20000,
    50000,
    35000,
    50000,
    50000,
    50000,
    2000,
    25000,
    15000
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Expressx'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/road.jpg'),
          fit: BoxFit.cover,
        )),
        // decoration: BoxDecoration(
        //image: DecorationImage(
        // image: AssetImage('assets/images/bus.jpg'), fit: BoxFit.cover)),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              //height: 50,
              title: Text('${data[index]}'),
              subtitle: Text('Price: ${price[index]}'),
              trailing: Icon(Icons.check),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Book()));
              },
            );
          },
        ),
      ),
    );
  }
}
/*Container(
            decoration:BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bus.jpg'), fit: BoxFit.cover)) ,
        ),*/
/* child: Column(
            children: [
              ListView(
                children: [
                  ListTile(
                    title: Text('Kampala to Mbarara'),
                  ),
                  ListTile(
                    title: Text('Kampala to Fortportal'),
                  ),
                  ListTile(
                    title: Text('Kampala to Mbale'),
                  ),
                  ListTile(
                    title: Text('Kampala to Gulu'),
                  ),
                  ListTile(
                    title: Text('Kampala to Hoima'),
                  ),
                ],
              )
            ],
          ),*/
