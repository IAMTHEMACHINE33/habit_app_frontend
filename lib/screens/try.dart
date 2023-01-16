import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipOval(
        child: Container(
          height: 100,
          width: 100,
          // color: Colors.amber,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://www.pngall.com/wp-content/uploads/2/Mario-Vs-Donkey-Kong-PNG-HD-Image.png"),
            ),
          ),
        ),
      ),
    );
  }
}
