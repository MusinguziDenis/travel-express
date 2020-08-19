import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_express/models/user.dart';
import 'package:travel_express/screens/authenticate/authenticate.dart';
import 'package:travel_express/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
