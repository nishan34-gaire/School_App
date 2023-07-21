import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

String day = DateTime.now().toString();

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  _page2State createState() => _page2State();
}

class _page2State extends State<page2> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime(2032),
            focusedDay: _focusedDay,
            calendarStyle: const CalendarStyle(
                cellPadding: EdgeInsets.all(2),
                todayDecoration: BoxDecoration(color: Colors.orange),
                weekendTextStyle: TextStyle(color: Colors.red),
                holidayDecoration: BoxDecoration(color: Colors.red)),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Todays date',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            day,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
