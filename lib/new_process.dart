//new_processs.dart

import 'package:flutter/material.dart';

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
    print(pickedDate);
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showing Dropdown Menu'),
        elevation: 4,
        backgroundColor: Colors.amber[700],
      ), //AppBar
      body: Column(
        children: [
          //CALANDER codes:
          const Text('Selected Dates'),
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
