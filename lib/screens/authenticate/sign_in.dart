import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_express/screens/authenticate/register.dart';
import 'package:travel_express/services/auth.dart';
import 'package:travel_express/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  bool loading = false;

  //text field state formed to track the changes in the entries
  String verificationId = '';
  String phone = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  //final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Sign in to Travel Express'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Form(
              child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: textInputDecoration.copyWith(hintText: 'Phone'),
                onChanged: (val) {
                  setState(() => phone = val);
                },
                //controller: _phoneController,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.red,
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  setState(() => loading = false);
                  // final _mobile = _phoneController.text.trim();
                  //registerwithPhoneNumber(phone, context);
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        // await _auth.signInWithPhoneNumber(phone, context);
                        verifyPhone(phone);
                    if (result == null) {
                      setState(() {
                        error = 'Please give a valid phone number';
                        loading = false;
                      });
                    }
                    print(phone);
                  }
                  //print(phone);
                },
              ),
              RaisedButton(
                child: Text('Sign in Anonymous'),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                },
              ),
            ],
          ))),
    );
  }
}

Future<void> verifyPhone(phone) async {
  final PhoneVerificationCompleted verified = (AuthCredential authResult) {
    AuthService().singIn(authResult);
  };
  final PhoneVerificationFailed verificationfailed =
      (AuthException authException) {
    print('${authException.message}');
  };
  final PhoneCodeSent smsSent = (String verId, [int ForceResend]) {};

  await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: verified,
      verificationFailed: verificationfailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: null);
}

/*RaisedButton(
          child: Text('Sign in Anonymous'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
          },
        ),*/
