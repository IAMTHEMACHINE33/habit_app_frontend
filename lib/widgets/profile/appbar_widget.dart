import 'package:flutter/material.dart';


AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
          icon: Icon(Icons.sunny_snowing),
          onPressed: () {},
        ),
    ],
  );
}
