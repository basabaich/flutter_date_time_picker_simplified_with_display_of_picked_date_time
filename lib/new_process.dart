//new_processs.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // We are calling this to display the picked
//date in the right format. we will call formatter variable below.

final formatter = DateFormat.yMd(); //This is the format for display

class NewProcess extends StatefulWidget {
  const NewProcess({super.key});
  @override
  State<NewProcess> createState() {
    return _NewProcessState();
  }
}

class _NewProcessState extends State<NewProcess> {
  //
  //
  //Define a variable as below:
  DateTime? _selectedDate;
  //The above variable is a "DateTime" variable & the questionmark means
  //in case the "_selectedDate" dont have the value or returns a null value
  //then the returned value will be null otherwise the specific date will be
  //shown
  //
  //The "showDatePicker()" uses a "Future". Which means that this function
  //will pick a date time value once the user clicks on the calender in future
  //So, in this case we can use ".then((value) {})" after the function
  //"showDatePicker()" like "showDatePicker(.....).then((value) {});"
  //Or else, we can use "async" before the second braces and "await" before the
  //"showDatePicker()" function as below.
  //
  //Also, when we use "await" in future type functions, we can access the
  //final value which is picked by the user & change the below code lines as
  //"final firstDate = DateTime(now.year - 1, now.month, now.day);"  ..line 1
  //"final pickedDate = await showDatePicker(......"                 ..line 2
  //
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    //print(pickedDate);
    //Instead of the print command we can show the picked date in the
    //application itself just before the DatePicker icon with the
    //"setState()" function as below:
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showing Calender Entry'),
        elevation: 4,
        backgroundColor: Colors.amber[700],
      ), //AppBar
      body: Column(
        children: [
          //CALANDER codes:
          Text(_selectedDate == null
              ? 'No date selected !'
              : formatter.format(_selectedDate!)), //Text
          //We are putting an exclamation mark after "_selectedDate()"
          //function as otherwise it was reporting an error as the
          //flutter thinks if this variable be "null". But we know that
          // this value will not be null as we have defined
          //"_selectedDate" value as :
          //DateTime ? _selectedDate;
          //So to force flutter that we know it will not report a null, we have
          //to add an exclamation mark at the end.
          IconButton(
            onPressed: _presentDatePicker,
            icon: const Icon(
              Icons.calendar_month,
            ), //Icon
          ), //IconButton
        ],
      ), //Column
    ); //Scaffold
  }
}
