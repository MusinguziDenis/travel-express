import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_express/models/user.dart';
import 'package:travel_express/screens/authenticate/register.dart';
import 'package:travel_express/screens/home/home.dart';
import 'package:travel_express/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _codeController = TextEditingController();
  final _phoneController = TextEditingController();

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change for user stream so that we get back only the bdata that we want
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //signin anonymous

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  //sign in with phone number
  Future signInWithPhoneNumber(String phone, BuildContext context) async {
    AuthCredential credential =
        PhoneAuthProvider.getCredential(verificationId: null, smsCode: null);
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      AuthResult result = await _auth.signInWithCredential(credential);
      FirebaseUser user = result.user;
      //return _userFromFirebaseUser(user);
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //register with phone number
  Future<bool> registerwithPhoneNumber(
      String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          //signin with phone number
          AuthResult result = await _auth.signInWithCredential(credential);
          FirebaseUser user = result.user;
          //create a document for thr user with the uid
          await DatabaseService(uid: user.uid).updateUserData(
              'name', '+256774548568', 'travelexpress@gmail.com');
          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          }
        },
        verificationFailed: (AuthException) {
          print(AuthException.message);
        },
        codeSent: (String verificationId, [int ForceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text('Enter the code'),
                  content: Column(
                    children: [
                      TextField(
                        controller: _codeController,
                      )
                    ],
                  ),
                  actions: [
                    FlatButton(
                      child: Text('Confirm'),
                      textColor: Colors.white,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);
                        AuthResult result =
                            await _auth.signInWithCredential(credential);
                        FirebaseUser user = result.user;
                        if (user != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
    //FirebaseUser user = result.user;
  }

  //handle authentication
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return Register();
          }
        });
  }

  //sign in
  singIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
