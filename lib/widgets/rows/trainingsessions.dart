import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TrainingSession extends StatelessWidget {
  final imageName;
  final String StartTime;
  final String EndTime;
  final Color StackColor;
  final String SessionName;
  const TrainingSession(
      {super.key,
      this.imageName,
      required this.StartTime,
      required this.EndTime,
      required this.StackColor,
      required this.SessionName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: 56,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: StackColor),
                ),
                Image.asset(
                  "assets/icons/" + imageName,
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            const SizedBox(
              width: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/time.png',
                      width: 10,
                      height: 10,
                      fit: BoxFit.contain,
                      color: Colors.deepOrange,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      StartTime + ' to ' + EndTime,
                      style: TextStyle(fontSize: 10, color: Colors.grey[10]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  SessionName,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Image.asset(
                'assets/icons/right-arrow.png',
                width: 15,
                height: 15,
                fit: BoxFit.contain,
                color: Colors.black,
              ),
            ),
          ],
        ),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8),
  child:   Divider(height: 0,thickness: 1, color: StackColor,),
),




        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Container(
              height: 2,
              width: 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.deepOrange,
              )),
        ),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Container(
              height: 2,
              width: 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.deepOrange,
              )),
        ),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Container(
              height: 2,
              width: 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.deepOrange,
              )),
        ),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Container(
              height: 2,
              width: 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.deepOrange,
              )),
        ),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Container(
              height: 2,
              width: 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.deepOrange,
              )),
        ),
        const SizedBox(
          height: 2,
        )
      ],
    );
  }
}
