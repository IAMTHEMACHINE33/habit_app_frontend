import 'package:flutter/material.dart';
import 'package:habit_app_front/repository/task_repository.dart';
import 'package:habit_app_front/repository/user_repository.dart';

import '../../app_styles.dart';
import '../../models/dropdown_friend.dart';
import '../../models/task.dart';
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
  final _taskKey = GlobalKey<FormState>();
  final _task_nameController = TextEditingController();
  final _penaltyControler = TextEditingController();

  String? _dropdownvalue;
  String? _value;
  void onSubmit() async {
    if (_taskKey.currentState!.validate()) {
      try{
        TaskRepository taskRepository = TaskRepository();
        bool isAdded = await TaskRepository().addTask(_task_nameController.text,_penaltyControler.text,_value);
        if(isAdded){
          debugPrint("Done");
        }
      }
      catch(e){
        debugPrint(e.toString());
      }
      
    }
  }

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
                child: Form(
                  key: _taskKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Add Task",
                        style: kBodyText1,
                      ),
                      TextFormField(
                        controller: _task_nameController,
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
                      TextFormField(
                        controller: _penaltyControler,
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
                      FutureBuilder<List<DropdownFriend?>>(
                        future: UserRepository().userFriend(),
                        builder: (context, snapshot) {
                          // _dropdownvalue = snapshot.data![0]!.id!;

                          if (snapshot.hasData) {
                            return DropdownButtonFormField(
                              decoration: InputDecoration(
                                hintText: 'Select Friend',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: kScaffoldBackground,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _value = newValue!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null) {
                                  return 'Please select Stock';
                                }
                                return null;
                              },
                              dropdownColor: kPrimaryColor,
                              value: _dropdownvalue,
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),
                              // Array list of items
                              items: snapshot.data!.map(
                                (DropdownFriend? items) {
                                  return DropdownMenuItem<String>(
                                    value: items!.id!,
                                    child: Text(
                                      items.username!,
                                      style: TextStyle(
                                        color: kScaffoldBackground,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            );
                          } else if (snapshot.hasError) {
                            return const Text("Error");
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //     hintText: 'Select Friend',
                      //     border: InputBorder.none,
                      //     hintStyle: TextStyle(
                      //       color: kScaffoldBackground,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 18,
                      //     ),
                      //   ),
                      //   value: selectedValue,
                      //   items: items
                      //       .map<DropdownMenuItem<String>>(
                      //           (String value) => DropdownMenuItem<String>(
                      //                 value: value,
                      //                 child: Text(
                      //                   value,
                      //                   style: TextStyle(
                      //                     color: kScaffoldBackground,
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 16,
                      //                   ),
                      //                 ),
                      //               ))
                      //       .toList(),
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       selectedValue = newValue!;
                      //     });
                      //   },
                      //   dropdownColor: kPrimaryColor,
                      // ),
                      const Divider(
                        color: kScaffoldBackground,
                        thickness: 0.2,
                      ),
                      MyTextButton(
                        buttonName: 'Enter',
                        onPressed: onSubmit,
                        bgColor: kScaffoldBackground,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
