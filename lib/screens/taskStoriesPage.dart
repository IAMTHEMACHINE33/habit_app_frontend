// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habit_app_front/models/task.dart';
import 'package:habit_app_front/repository/task_repository.dart';
import 'package:habit_app_front/screens/NavbarPage.dart';

import '../app_styles.dart';
import '../utils/messages.dart';
import '../utils/url.dart';
import '../widgets/buttons/my_text_button.dart';
import '../widgets/stories/story_bar.dart';

class StoryPage extends StatefulWidget {
  final String storyImg;
  final String taskId;
  const StoryPage({Key? key, required this.storyImg,required this.taskId}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  List<Widget> myStories = [];
  List<double> percentWatched = [];

  @override
  void initState() {
    super.initState();
    myStories = [
      MyStory1(storyImg: widget.storyImg,taskId: widget.taskId),
      // MyStory2(),
      // MyStory3()
    ];

    // initially, all stories haven't been watched yet
    for (int i = 0; i < myStories.length; i++) {
      percentWatched.add(0);
    }

    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        // only add 0.01 as long as it's below 1
        if (percentWatched[currentStoryIndex] + 0.01 < 1) {
          percentWatched[currentStoryIndex] += 0.01;
        }
        // if adding 0.01 exceeds 1, set percentage to 1 and cancel timer
        else {
          percentWatched[currentStoryIndex] = 1;
          timer.cancel();

          // also go to next story as long as there are more stories to go through
          if (currentStoryIndex < myStories.length - 1) {
            currentStoryIndex++;
            // restart story timer
            _startWatching();
          }
          // if we are finishing the last story then return to homepage
          // else {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => NavbarPage()),
          //   );
          // }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    // user taps on first half of screen
    if (dx < screenWidth / 2) {
      setState(() {
        // as long as this isnt the first story
        if (currentStoryIndex > 0) {
          // set previous and curent story watched percentage back to 0
          percentWatched[currentStoryIndex - 1] = 0;
          percentWatched[currentStoryIndex] = 0;

          // go to previous story
          currentStoryIndex--;
        }
      });
    }
    // user taps on second half of screen
    else {
      setState(() {
        // if there are more stories left
        if (currentStoryIndex < myStories.length - 1) {
          // finish current story
          percentWatched[currentStoryIndex] = 1;
          // move to next story
          currentStoryIndex++;
        }
        // if user is on the last story, finish this story
        else {
          percentWatched[currentStoryIndex] = 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            // story
            myStories[currentStoryIndex],

            // progress bar
            MyStoryBars(
              percentWatched: percentWatched,
            ),
          ],
        ),
      ),
    );
  }
}

class MyStory1 extends StatefulWidget {
  final String storyImg;
  final String taskId;
  const MyStory1({Key? key, required this.storyImg,required this.taskId}) : super(key: key);

  @override
  State<MyStory1> createState() => _MyStory1State();
}

class _MyStory1State extends State<MyStory1> {
  void onAccept()async{
    try{
      TaskRepository taskRepository = TaskRepository();
       bool isAccepted = await TaskRepository()
            .acceptTask(widget.taskId);
        if (isAccepted) {
          displaySuccessMessage(context, "Proof Accepted!");
          Future.delayed(Duration(seconds: 2), () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavbarPage()));

          });
        } else {
          displayErrorMessage(context, "Proof Didn't Accepted!");
        }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragDown: (dragUpdateDetails) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavbarPage()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.green[200],
        body: SingleChildScrollView(
            child: widget.storyImg != "image"
                ? Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("$pic_Url${widget.storyImg}"),
                            ),
                          ),
                        ),
                      ),
                      Positioned(bottom:0,
                        child: MyTextButton(
                          buttonName: 'ACCEPT',
                          onPressed: () async {
                            bool isAccepted = await TaskRepository().acceptTask(widget.taskId);
                          },
                          bgColor: kPrimaryColor,
                        ),
                      ),
                    ],
                  )
                : Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text("Nothing to show"),
                    ),
                  )
            // else Center(child:Text("Nothing to show")
            ),
      ),
    );
  }
}
