import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendaryPick extends StatefulWidget {
  CalendaryPick({Key key}) : super(key: key);

  @override
  _CalendaryPickState createState() => _CalendaryPickState();
}

class _CalendaryPickState extends State<CalendaryPick> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendary de rendez-vous'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.orange,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events){
                print(date.toIso8601String());
              },
              calendarController: _calendarController),
        ),
      ),
    );
  }
}
