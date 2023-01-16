import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/profile/appbar_widget.dart';
import '../widgets/profile/button_widget.dart';
import '../widgets/profile/profile_widget.dart';
import '../widgets/profile/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                isEdit: true,
                onClicked: () {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                  label: 'Full Name',
                  text: "user.name",
                  onChanged: (name) => {}),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Email',
                text: "user.email",
                onChanged: (email) => {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'About',
                text: "user.about",
                maxLines: 5,
                onChanged: (about) => {},
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Save',
                onClicked: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
}
