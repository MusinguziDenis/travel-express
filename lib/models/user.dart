class User {
  final String uid;
  final String email;

  User({this.uid, this.email});
}

class UserData {
  final String uid;
  final String name;
  final String email;
  final String phone;
  UserData({this.uid, this.name, this.email, this.phone});
}

class JourneyData {
  final String uid;
  final int day;
  final String month;
  final int year;
  final String destination;
  final String departure;
  final String time;
  JourneyData(
      {this.uid,
      this.day,
      this.month,
      this.year,
      this.departure,
      this.destination,
      this.time});
}
