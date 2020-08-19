import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_express/models/tript.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference tripCollection =
      Firestore.instance.collection('trips');
  Future updateUserData(String name, String number, String email) async {
    return await tripCollection.document(uid).setData({
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
}

/*class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});
  final CollectionReference schedulesCollection =
      Firestore.instance.collection('schedule');

  Future updateSchedule(
      String day, String departure, String destination, String time) async {
    return await schedulesCollection.document(uid).setData({
      'day': day,
      'departure': departure,
      'destination': destination,
      'time': time
    });
  }

  //get schedules stream
  Stream<QuerySnapshot> get schedule {
    return schedulesCollection.snapshots();
  }
}*/
