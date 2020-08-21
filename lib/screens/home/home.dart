import 'package:flutter/material.dart';
import 'package:travel_express/screens/home/drawer.dart';
import 'package:travel_express/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Travel Express'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text('Logout'),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bus.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Container(
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset('assets/images/busesstop.jpg'),
                        //SizedBox(
                        //  height: 5.0,
                        //),
                        /* Text('About',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ))),*/
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Container(
                  child: Card(
                    color: Colors.blue[100],
                    child: Column(
                      children: [
                        //Image.asset('assets/images/busesstop.jpg'),
                        //SizedBox(
                        // height: 10.0,
                        //  ),
                        Text('About',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                //backgroundColor: Colors.pinkAccent,
                                color: Colors.black,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ))),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                            'At Travel Express we help you book your bus trip in advance. This will you have a peace of mind as you\'ll be assured of your trip. We do this very efficiently and it takes less than a minute.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                //backgroundColor: Colors.pinkAccent,
                                color: Colors.black,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ))),
                        // SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Container(
                  child: Card(
                    color: Colors.blue[100],
                    elevation: 0.0,
                    child: Column(
                      children: [
                        //Image.asset('assets/images/busesstop.jpg'),
                        //SizedBox(
                        // height: 10.0,
                        //  ),

                        SizedBox(height: 10.0),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text('Contact Us'),
                          subtitle: Text('0773652831'),
                          //trailing: Icon(Icons.phone),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.email),
                          title: Text('Email Us'),
                          subtitle: Text('travelexpress@gmail.com'),
                          // trailing: Icon(Icons.email),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
