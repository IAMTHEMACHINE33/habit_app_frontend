import 'package:flutter/material.dart';
import 'package:habit_app_front/size_configs.dart';

import '../app_styles.dart';
import '../widgets/rows/Activities.dart';
import '../widgets/rows/trainingsessions.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
                          const CircleAvatar(
                            backgroundColor: kScaffoldBackground,
                            backgroundImage:
                                AssetImage('assets/icons/man-avatar.png'),
                            radius: 20,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              const Icon(
                                Icons.notifications,
                                color: kScaffoldBackground,
                              ),
                              Padding(  
                                padding:
                                    const EdgeInsets.only(right: 2, top: 5),
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 1,
                      ),

                      // user name ==>>>

                      Text(
                        "welcome",
                        style: kBodyText1,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                       Text(
                        "Waheed Ashraf",
                        style: kTitle2,
                      ),

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
                        children:  [
                          Activitie(
                              Nameimage: 'cyclist.png',
                              ActivitieName: 'Cycling',
                              Style:kOpacityTextStyle,
                              ContainerColor:
                                  kLightBoxBlue),
                          Activitie(
                              Nameimage: 'runner.png',
                              ActivitieName: 'Running',
                              Style:kOpacityTextStyle,
                              ContainerColor:kLightBoxPink
                                  ),
                          Activitie(
                              Nameimage: 'trainer.png',
                              ActivitieName: 'CrossFit',
                              Style:kOpacityTextStyle,
                              ContainerColor:
                                  kLightBoxBlue),
                          Activitie(
                              Nameimage: 'sit-up.png',
                              ActivitieName: 'Cycling',
                              Style:kOpacityTextStyle,
                              ContainerColor:
                                  kLightBoxPink),
                          Activitie(
                              Nameimage: 'swimming.png',
                              ActivitieName: 'Swimming',
                              Style:kOpacityTextStyle,
                              ContainerColor:
                                  kLightBoxBlue),
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
                        TrainingSession(
                          StartTime: '2:00',
                          EndTime: '3:30',
                          SessionName: 'CrossFit',
                          imageName: 'trainer.png',
                          StackColor: kLightBoxBlue,
                        ),
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
