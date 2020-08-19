import 'package:flutter/material.dart';
import 'package:travel_express/services/auth.dart';
import 'package:travel_express/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String phone = '';
  String error = '';
  String name = '';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          title: Text('Sign up to Travel Express'),
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('SignIn'),
              onPressed: () {
                widget.toggleView();
              },
            ),
          ]),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Name'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter your name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter your email' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Phone'),
                      validator: (val) => val.length < 10
                          ? 'Enter a correct phone number'
                          : null,
                      onChanged: (val) {
                        setState(() => phone = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.red,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        setState(() => loading = true);
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.registerwithPhoneNumber(
                              phone, context);
                          if (result == null) {
                            setState(() {
                              error = 'Please give a valid phone number';
                              loading = false;
                            });
                          }
                          print(phone);
                        }
                        print(phone);
                      },
                    )
                  ],
                )),
          )),
    );
  }
}
