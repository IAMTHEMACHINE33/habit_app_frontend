import 'dart:io';

import 'package:flutter/material.dart';

import '../../repository/user_repository.dart';
import '../../response/user info/load_user_response.dart';
import '../../utils/url.dart';

class ProfileWidget extends StatelessWidget {
  // final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    // required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    // final image = imagePath.contains('https://www.pngall.com/wp-content/uploads/2/Mario-Vs-Donkey-Kong-PNG-HD-Image.png')
    //     ? NetworkImage(imagePath)
    //     : FileImage(File(imagePath));

    return FutureBuilder<LoadUserResponse?>(
      future: UserRepository().userInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            return ClipOval(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  height: 100,
                  width: 100,
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image:  DecorationImage(
                      image:  NetworkImage(
                                            "$pic_Url${snapshot.data!.data!.profile_pic}"),
                    ),
                  ),
                ),
              ),
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
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
