import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:travel_express/models/tript.dart';
import 'package:travel_express/models/user.dart';
import 'package:travel_express/screens/home/confirmation_tile.dart';
import 'package:travel_express/screens/home/journey_tile.dart';

class ConfirmationList extends StatefulWidget {
  @override
  _ConfirmationListState createState() => _ConfirmationListState();
}

class _ConfirmationListState extends State<ConfirmationList> {
  @override
  Widget build(BuildContext context) {
    final journeys = Provider.of<List<Journeys>>(context) ?? [];
    return ConfirmationTile();
  }
}
