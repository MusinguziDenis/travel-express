import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_express/models/user.dart';
import 'package:travel_express/screens/home/trip_tile.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //final trips = Provider.of<List<Tripd>>(context) ?? [];

    //return ListView.builder(
    //itemCount: trips.length,
    //itemBuilder: (context, index) {
    return TripTile(); //(trip: trips[index]);
    // });
    /* trips.forEach((trip) {
      print(trip.name);
      print(trip.number);
      print(trip.email);
    });*/

    //print(trips.documents);
    //for (var doc in trips.documents) {
    //print(doc.data);
    //}
    return Container();
  }
}
