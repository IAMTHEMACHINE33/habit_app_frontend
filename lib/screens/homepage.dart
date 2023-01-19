import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app_front/size_configs.dart';

import '../app_styles.dart';
import '../repository/user_repository.dart';
import '../response/user info/load_user_response.dart';
import '../utils/url.dart';
import '../widgets/pop_up/hero_dialog_route.dart';
import '../widgets/rows/Activities.dart';
import '../widgets/rows/trainingsessions.dart';
import '../widgets/pop_up/popUpPage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    const String _heroAddTodo = 'add-todo-hero';
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25)),
                  color: kPrimaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //avatar and notification =>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder<LoadUserResponse?>(
                            future: UserRepository().userInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.data !=
                                    null) {
                                  return CircleAvatar(
                                    backgroundColor: kScaffoldBackground,
                                    backgroundImage:
                                        // AssetImage('assets/icons/man-avatar.png'),
                                        NetworkImage(
                                            "$pic_Url${snapshot.data!.data!.profile_pic}"),
                                    radius: 20,
                                  );
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.blue),
                                  ),
                                );
                              }
                            },
                          ),
                          // const CircleAvatar(
                          //   backgroundColor: kScaffoldBackground,
                          //   backgroundImage:
                          //       AssetImage('assets/icons/man-avatar.png'),
                          //   radius: 20,
                          // ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(HeroDialogRoute(builder: (context) {
                                return AddTodoPopupCard();
                              }));
                            },
                            child: Hero(
                              tag: _heroAddTodo,
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  SvgPicture.asset('assets/icons/plus.svg'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 1,
                      ),
                      Text(
                        "welcome",
                        style: kBodyText1,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      FutureBuilder<LoadUserResponse?>(
                        future: UserRepository().userInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.data != null) {
                              return Text(
                                "${snapshot.data!.data!.fullname}",
                                style: kTitle2,
                              );
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
                      // Text(
                      //   "Waheed Ashraf",
                      //   style: kTitle2,
                      // ),

                      const SizedBox(
                        height: 30,
                      ),

                      // progress indicator =>>>>>>>>>>>>>>>>>>>>
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          width: double.infinity,
                          color: kScaffoldBackground.withOpacity(0.4),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                // CircularPercentIndicator(
                                //   radius: 10.0,
                                //   lineWidth: 5.0,
                                //   percent: .30,
                                //   progressColor: Colors.deepOrange,
                                //   backgroundColor: Colors.white,
                                // ),
                                const Text(
                                  '  you finished 30% from your goals ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kSecondaryColor,
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  'assets/icons/right-arrow.png',
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.contain,
                                  color: kScaffoldBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Training plane ==========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Training plane',
                      style: kBodyText2,
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // Training plane Activities =====================>>>>>>>>>>

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Activitie(
                              Nameimage: 'cyclist.png',
                              ActivitieName: 'Cycling',
                              Style: kOpacityTextStyle,
                              ContainerColor: kLightBoxBlue),
                          Activitie(
                              Nameimage: 'runner.png',
                              ActivitieName: 'Running',
                              Style: kOpacityTextStyle,
                              ContainerColor: kLightBoxPink),
                          Activitie(
                              Nameimage: 'trainer.png',
                              ActivitieName: 'CrossFit',
                              Style: kOpacityTextStyle,
                              ContainerColor: kLightBoxBlue),
                          Activitie(
                              Nameimage: 'sit-up.png',
                              ActivitieName: 'Cycling',
                              Style: kOpacityTextStyle,
                              ContainerColor: kLightBoxPink),
                          Activitie(
                              Nameimage: 'swimming.png',
                              ActivitieName: 'Swimming',
                              Style: kOpacityTextStyle,
                              ContainerColor: kLightBoxBlue),
                        ],
                      ),
                    ),

                    // Training Sessiones ===================>>>>>>>>>>>>>>>>>>>>

                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Training Sessiones',
                      style: kBodyText2,
                    ),
                    const SizedBox(
                      height: 13,
                    ),

                    Column(
                      children: [
                        Snaprow(),
                        const SizedBox(height: 5),
                        TrainingSession(
                            StartTime: '3:30',
                            EndTime: '4:30',
                            SessionName: 'Cycling',
                            imageName: 'cyclist.png',
                            StackColor: kLightBoxPink),
                        TrainingSession(
                          StartTime: '8:00',
                          EndTime: '9:30',
                          SessionName: 'Strength',
                          imageName: 'sit-up.png',
                          StackColor: kLightBoxBlue,
                        ),
                        TrainingSession(
                          StartTime: '10:00',
                          EndTime: '11:30',
                          SessionName: 'Running',
                          imageName: 'runner.png',
                          StackColor: kLightBoxBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Snaprow extends StatelessWidget {
  const Snaprow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          // const SizedBox(width: 15),
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset('assets/icons/man-avatar.png')
              // Image.asset(friend.image),
              ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Style.friendName("friend.name"),
              Row(
                children: [
                  // Friend.statusIconMap[friend.status]!,
                  Friend.statusIconMap[8]!,
                  const SizedBox(width: 7),
                  Style.chatInfo(
                      // "${Friend.statusTextMap[friend.status]!} • ${friend.time}"),
                      "asdasd")
                ],
              ),
            ],
          ),
          const Spacer(),
          // if (friend.streak > 1)
          Style.streakText("12 🔥"),
          // Style.streakText("${friend.streak.toString()} 🔥"),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}
