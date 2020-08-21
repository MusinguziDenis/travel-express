import 'package:flutter/material.dart';
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
    final journeys = Provider.of<List<Journeys>>(context) ?? [];

    return JourneyTile();
  }
}
