import 'package:flutter/material.dart';

import '../app_styles.dart';
import '../repository/user_repository.dart';
import '../response/user info/load_user_response.dart';
import '../widgets/badge/donut_tab.dart';
import '../widgets/badge/my_tab.dart';
import '../widgets/profile/numbers_widget.dart';
import '../widgets/profile/profile_widget.dart';
import 'editProfilePage.dart';

class BadgePage extends StatefulWidget {
  const BadgePage({super.key});

  @override
  State<BadgePage> createState() => _BadgePageState();
}

class _BadgePageState extends State<BadgePage> {
  List<Widget> myTabs = const [
    MyTab(
      iconPath: 'assets/icons/donut.png',
    ),
    // MyTab(
    //   iconPath: 'assets/icons/burger.png',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ProfileWidget(
                // imagePath: '',
                onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 18),
              buildName(),
              // const SizedBox(height: 24),
              // Center(child: buildUpgradeButton()),
              const SizedBox(height: 12),
              NumbersWidget(),
              const SizedBox(height: 24),
              buildAbout(),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
              //   child: Row(
              //     children: [
              //       Text(
              //         'I want to eat',
              //         style: TextStyle(fontSize: 24, color: Colors.grey[600]),
              //       ),
              //       Text(
              //         ' EAT',
              //         style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              // ),
              // tab bar
              TabBar(tabs: myTabs),
              Text("Badges",style: kTitle2,),
              Expanded(
                child: TabBarView(
                  children: [
                    DonutTab(),
                    // DonutTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName() => FutureBuilder<LoadUserResponse?>(
        future: UserRepository().userInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return Column(
                children: [
                  Text(
                    "${snapshot.data!.data!.username}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${snapshot.data!.data!.email}",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              );
            } else {
              return const Center(
                child: Text("No data"),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          }
        },
      );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'About',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                "Trying to improve",
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
            ),
          ],
        ),
      );
}
