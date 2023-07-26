//new_processs.dart

import 'package:flutter/material.dart';
import './expense.dart';

class NewProcess extends StatefulWidget {
  const NewProcess({super.key});
  @override
  State<NewProcess> createState() {
    return _NewProcessState();
  }
}

class _NewProcessState extends State<NewProcess> {
  //
  //This will save the selected category by the user in the "_selectedCategory"
  //variable. Also the initial category will be displayed as "Leisure"
  Category _selectedCategory = Category.leisure;
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
          // DROPDOWN codes:
          DropdownButton(
            value: _selectedCategory,
            items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name.toUpperCase(),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              //print(value);
              //
              //If value is null & user did not set a value to it,
              //then it will return nothing - as per below code outside
              //the "setState()" function.
              if (value == null) {
                return;
                //NOTE: When we put 'return' in a fucntion and the vriable
                //'value' is null, then no codes within this function
                //i.e. wihtin "onChanged: () {}" function
                //after 'return' code (i.e. the setState() code) will be
                //executed.
              }
              setState(
                () {
                  _selectedCategory = value;
                  //When the 'value' is not null, it will store the selected
                  //category properties value in the variable
                  //"_selectedCategory"
                },
              );
            },
          ), //DropdownButton
        ],
      ), //Column
    ); //Scaffold
  }
}
