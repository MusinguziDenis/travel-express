import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_express/models/user.dart';
import 'package:travel_express/services/database.dart';
import 'package:travel_express/shared/constants.dart';
import 'package:travel_express/shared/loading.dart';

class UpdateForm extends StatefulWidget {
  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final _formKey = GlobalKey<FormState>();
  String _currentName;
  String _currentEmail;
  String _currentPhone;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<UserData>(
            stream: DatabaseService(uid: user.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Update your account',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        initialValue: userData.name,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Name'),
                        validator: (value) =>
                            value.isEmpty ? 'Please enter your name' : null,
                        onChanged: (value) =>
                            setState(() => _currentName = value),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        initialValue: userData.email,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (value) =>
                            value.isEmpty ? 'Please enter your email' : null,
                        onChanged: (value) =>
                            setState(() => _currentEmail = value),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        initialValue: userData.phone,
                        decoration: textInputDecoration,
                        validator: (value) =>
                            value.isEmpty ? 'Please enter your name' : null,
                        onChanged: (value) =>
                            setState(() => _currentPhone = value),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: user.uid).updateUserData(
                                _currentName ?? userData.name,
                                _currentPhone ?? userData.phone,
                                _currentEmail ?? userData.email);
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  ),
                );
              } else {
                return Loading();
              }
            }),
      ),
    );
  }
}
