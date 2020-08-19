import 'package:flutter/material.dart';
import 'package:travel_express/models/users.dart';
import 'package:travel_express/screens/home/book.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  List<Users> users;
  List<Users> selectedUsers;
  @override
  void initState() {
    selectedUsers = [];
    users = Users.getUsers();
    super.initState();
  }

  onSelectedRow(bool selected, users) async {
    setState(() {
      if (selected) {
        selectedUsers.add(users);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Book()));
      } else {
        selectedUsers.remove(users);
      }
    });
  }

  DataTable dataBody() {
    return DataTable(
      //sortAscending: true,
      //sortColumnIndex: 0,
      columnSpacing: 25.0,
      //showCheckboxColumn: true,
      columns: [
        DataColumn(
            label: Text('Day'),
            numeric: false,
            tooltip: 'This is the day of the week'),
        DataColumn(
            label: Text('Departure'),
            numeric: false,
            tooltip: 'This is  the departure point'),
        DataColumn(
            label: Text('Destination'),
            numeric: false,
            tooltip: 'This is the destination'),
        DataColumn(
            label: Text('Time'),
            numeric: false,
            tooltip: 'This is the time of departure'),
      ],
      rows: users
          .map(
            (users) => DataRow(
                selected: selectedUsers.contains(users),
                onSelectChanged: (b) {
                  onSelectedRow(b, users);
                },
                cells: [
                  DataCell(
                    Text(users.day),
                    onTap: () {
                      print('Selected ${users.day}');
                    },
                  ),
                  DataCell(
                    Text(users.departure),
                  ),
                  DataCell(
                    Text(users.destination),
                  ),
                  DataCell(
                    Text(users.DT),
                  ),
                ]),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: dataBody(),
            )
          ],
        ),
      ),
    );
  }
}
