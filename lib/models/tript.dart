class Tripd {
  final String name;
  final String number;
  final String email;
  Tripd({this.name, this.number, this.email});
}

class Schedules {
  final String day;
  final String departure;
  final String destination;
  final String time;
  Schedules({this.day, this.departure, this.destination, this.time});
}

class Journeys {
  final int day;
  final String month;
  final int year;
  final String departure;
  final String destination;
  final String time;

  Journeys(
      {this.day,
      this.month,
      this.year,
      this.departure,
      this.destination,
      this.time});
}
