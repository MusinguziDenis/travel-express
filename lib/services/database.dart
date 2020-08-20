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
      email: snapshot.data['email'],
      phone: snapshot.data['number'],
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

  //journeys lsit from snapshot
  List<Journeys> _journeyListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Journeys(
        day: doc.data['day'] ?? 0,
        month: doc.data['month'] ?? '',
        year: doc.data['year'] ?? 0,
        departure: doc.data['departure'] ?? '',
        destination: doc.data['destination'] ?? '',
        time: doc.data['time'],
      );
    }).toList();
  }

  //journeyData from Snapshot
  JourneyData _journeyDataFromSnapshot(DocumentSnapshot snapshot) {
    return JourneyData(
      uid: uid,
      day: snapshot.data['day'],
      month: snapshot.data['month'],
      year: snapshot.data['year'],
      departure: snapshot.data['departure'],
      destination: snapshot.data['destination'],
      time: snapshot.data['time'],
    );
  }

  //get journey stream
  Stream<List<Journeys>> get journeys {
    return journeyCollection.snapshots().map(_journeyListFromSnapshot);
  }

  //get user doc stream
  Stream<JourneyData> get journeyData {
    return journeyCollection
        .document(uid)
        .snapshots()
        .map(_journeyDataFromSnapshot);
  }
}
