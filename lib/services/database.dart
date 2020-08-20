import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_express/models/tript.dart';
import 'package:travel_express/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference tripCollection =
      Firestore.instance.collection('trips');
  Future updateUserData(String name, String number, String email) async {
    return await tripCollection.document(uid).setData({
      //links the user and firestore and we use setdata to update the
      //users data
      'name': name,
      'number': number,
      'email': email,
    });
  }

  //trip list from snapshot
  List<Tripd> _tripListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Tripd(
          name: doc.data['name'] ?? '',
          number: doc.data['number'] ?? '',
          email: doc.data['email'] ?? '');
    }).toList();
  }

  //get trip stream
  Stream<List<Tripd>> get trips {
    return tripCollection.snapshots().map(_tripListFromSnapshot);
  }

  //userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['name'],
      phone: snapshot.data['name'],
    );
  }

//get user doc stream
  Stream<UserData> get userData {
    return tripCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});
  final CollectionReference journeyCollection =
      Firestore.instance.collection('journey');
  Future updateJourney(int day, String month, int year, String departure,
      String destination, String time) async {
    return await journeyCollection.document(uid).setData({
      'day': day,
      'month': month,
      'year': year,
      'departure': departure,
      'destination': destination,
      'time': time
    });
  }
}
