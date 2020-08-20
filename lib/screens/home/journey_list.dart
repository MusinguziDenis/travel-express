import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:travel_express/models/tript.dart';
import 'package:travel_express/screens/home/journey_tile.dart';

class JourneyList extends StatefulWidget {
  @override
  _JourneyListState createState() => _JourneyListState();
}

class _JourneyListState extends State<JourneyList> {
  @override
  Widget build(BuildContext context) {
    final journeys = Provider.of<List<Journeys>>(context);
    return ListView.builder(
      itemCount: journeys.length,
      itemBuilder: (context, index) {
        return JourneyTile(journey: journeys[index]);
      },
    );
  }
}
