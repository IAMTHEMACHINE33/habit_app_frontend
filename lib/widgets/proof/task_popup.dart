import 'dart:io';

import 'package:flutter/material.dart';
import 'package:habit_app_front/repository/task_repository.dart';
import 'package:habit_app_front/repository/user_repository.dart';

import '../../app_styles.dart';
import '../../models/dropdown_friend.dart';
import '../../models/task.dart';
import '../../response/task info/load_task_response.dart';
import '../../screens/NavbarPage.dart';
import '../../screens/homepage.dart';
import '../buttons/my_text_button.dart';

const String _heroAddTodo = 'add-todo-hero';
class ProofPopupCard extends StatefulWidget {
    final File? img;
  const ProofPopupCard({Key? key,required this.img}) : super(key: key);

  @override
  State<ProofPopupCard> createState() => _ProofPopupCardState();
}

class _ProofPopupCardState extends State<ProofPopupCard> {
  String? _dropdownvalue;
  String? _value;
  void onSubmit(String task_id) async {
    try {
      TaskRepository taskRepository = TaskRepository();
      bool isAdded = await TaskRepository().uploadTaskProof(widget.img,task_id);
      if (isAdded) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  NavbarPage()),
        );
        
      }
    } catch (e) {
      debugPrint(e.toString());
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Add Proof to Task",
                      style: kBodyText1,
                    ),
                    FutureBuilder<LoadTaskResponse?>(
                      future: TaskRepository().userTask(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data != null) {
                            String image = "";
                            int? ind;
                            int b = -1;
                            int c = -1;
                            bool d = false;
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  // print(snapshot.data!.data![index].proof!.length);

                                  print(snapshot.data!.data![index].id);
                                  return TextButton(
                                    onPressed: () {
                                        onSubmit("${snapshot.data!.data![index].id}");
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "${snapshot.data!.data![index].task_name}",
                                          style: TextStyle(
                                            color: kScaffoldBackground,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const Divider(
                                          color: kScaffoldBackground,
                                          thickness: 0.2,
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return const Center(
                              child: Text("No data"),
                            );
                          }
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          );
                        }
                      },
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
