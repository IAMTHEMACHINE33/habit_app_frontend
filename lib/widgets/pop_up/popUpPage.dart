import 'package:flutter/material.dart';

import '../../app_styles.dart';
import '../buttons/my_text_button.dart';

const String _heroAddTodo = 'add-todo-hero';
final items = ['One', 'Two', 'Three', 'Four'];
String selectedValue = 'Four';

class AddTodoPopupCard extends StatefulWidget {
  const AddTodoPopupCard({Key? key}) : super(key: key);

  @override
  State<AddTodoPopupCard> createState() => _AddTodoPopupCardState();
}

class _AddTodoPopupCardState extends State<AddTodoPopupCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          child: Material(
            color: kPrimaryColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Add Task",
                      style: kBodyText1,
                    ),
                    const TextField(
                      style: TextStyle(
                          color: kScaffoldBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      decoration: InputDecoration(
                        hintText: 'Daily Task',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: kScaffoldBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      cursorColor: Colors.white,
                    ),
                    const Divider(
                      color: kScaffoldBackground,
                      thickness: 0.5,
                    ),
                    const TextField(
                      style: TextStyle(
                          color: kScaffoldBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      decoration: InputDecoration(
                        hintText: 'Penalty',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: kScaffoldBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      cursorColor: kScaffoldBackground,
                    ),
                    const Divider(
                      color: kScaffoldBackground,
                      thickness: 0.2,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Select Friend',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: kScaffoldBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      value: selectedValue,
                      items: items
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: kScaffoldBackground,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      dropdownColor: kPrimaryColor,
                    ),
                    const Divider(
                      color: kScaffoldBackground,
                      thickness: 0.2,
                    ),
                    MyTextButton(
                      buttonName: 'Enter',
                      onPressed: () {},
                      bgColor: kScaffoldBackground,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
