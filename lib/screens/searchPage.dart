import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:habit_app_front/repository/user_repository.dart';
import 'package:habit_app_front/screens/homepage.dart';

import '../app_styles.dart';
import '../repository/task_repository.dart';
import '../response/task info/load_task_response.dart';
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
  List<bool>? _isEnabledList;
  List<String> _items = ['Arush', 'Samu rai', 'Neerav'];

  @override
  void initState() {
    super.initState();
    _isEnabledList = List.filled(_items.length, true);
  }

  void _disableButton(int index) {
    setState(() {
      _isEnabledList![index] = false;
    });
  }

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
                onChanged: (z) {
                  showSearch(context: context, delegate: CustomSearch());
                },
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
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {},
                  child: SizedBox(
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
                            Style.friendName("${_items[index]}"),
                            // Row(
                            //   children: [
                            //     // Friend.statusIconMap[friend.status]!,
                            //     Friend.statusIconMap[8]!,
                            //     const SizedBox(width: 7),
                            //     Style.chatInfo("sa")
                            //   ],
                            // ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: _isEnabledList![index]
                              ? () => _disableButton(index)
                              : null,
                          child: Text(_isEnabledList![index]
                              ? 'Add friend'
                              : 'Requested'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
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

class CustomSearch extends SearchDelegate {
  List<String> allData = ["Arush", "Sam rai", "Neerav", "Zokchen"];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
