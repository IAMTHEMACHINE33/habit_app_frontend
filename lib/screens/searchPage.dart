import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:habit_app_front/screens/homepage.dart';

import '../app_styles.dart';
import '../size_configs.dart';
import '../widgets/rows/Activities.dart';
import '../widgets/rows/trainingsessions.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({super.key});

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  final TextEditingController searchController = TextEditingController();

  String query = '';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.search, color: Colors.grey),
              title: TextField(
                controller: searchController,
                onChanged: (z) => setState(() => query = z.toLowerCase()),
                decoration: InputDecoration(
                  hintText: "Search ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
              trailing: IconButton(
                  onPressed: clearSearch,
                  icon: Icon(Icons.clear, color: Colors.grey)),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return Snaprow();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void clearSearch() {
    searchController.clear();
    query = '';
    FocusScope.of(context).unfocus();
  }
}
