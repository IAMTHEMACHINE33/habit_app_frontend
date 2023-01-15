import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './size_configs.dart';

const Color kPrimaryColor = Color(0xffFC9D45);
const Color kSecondaryColor = Color(0xff573353);
const Color kScaffoldBackground = Color(0xffFFF3E9);
const Color kLightBoxBlue = Color.fromARGB(255, 215, 250, 255);
const Color kLightBoxPink =Color.fromARGB(255, 255, 200, 200);
final kTitle = TextStyle(
  fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeH! * 7,
  color: kSecondaryColor,
);

final kTitle2 = TextStyle(
  fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeH! * 6,
  color: kSecondaryColor,
);

final kBodyText1 = TextStyle(
  color: kSecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 4.5,
  fontWeight: FontWeight.bold,
);

final kBodyText2 = TextStyle(
  color: kSecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 4,
  fontWeight: FontWeight.bold,
);

final kBodyText3 = TextStyle(
    color: kSecondaryColor,
    fontSize: SizeConfig.blockSizeH! * 3.8,
    fontWeight: FontWeight.normal);

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide.none,
);

final kInputHintStyle = kBodyText2.copyWith(
  fontWeight: FontWeight.normal,
  color: kSecondaryColor.withOpacity(0.5),
);

final kOpacityTextStyle = kBodyText2.copyWith(
  fontWeight: FontWeight.normal,
  fontSize: SizeConfig.blockSizeH! *0.2,
  color: kSecondaryColor.withOpacity(0.5),
);
  
class Style{
  static const Color blackText = Colors.black;
  static const Color grayText = Color(0xff8f8f8f);
  static const Color imageColor = Color(0xffF33A57);
  static const Color blueNavbar = Color(0xff00B6FF);

  static const Color videoColor = Color(0xffA05DCD);
  static const Color chatColor = blueNavbar;
  static Text friendName(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 18,
      color: blackText,
    ),
  );
  static Text chatInfo(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      color: grayText,
    ),
  );
  static Text streakText(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 16,
      color: blackText,
    ),
  );
}

 
class Friend{
  static final Map<int, Icon> statusIconMap = {
    0: const Icon(CupertinoIcons.square_fill, color: Style.imageColor, size: 15),
    1: const Icon(CupertinoIcons.square_fill, color: Style.videoColor, size: 15),
    2: const Icon(Icons.chat_bubble, color: Style.chatColor, size: 15),
    3: const Icon(CupertinoIcons.square, color: Style.imageColor, size: 15),
    4: const Icon(CupertinoIcons.square, color: Style.videoColor, size: 15),
    5: const Icon(Icons.chat_bubble_outline, color: Style.chatColor, size: 15),
    6: const Icon(Icons.send_rounded, color: Style.imageColor, size: 15),
    7: const Icon(Icons.send_rounded, color: Style.videoColor, size: 15),
    8: const Icon(Icons.send_rounded, color: Style.chatColor, size: 15),
    9: const Icon(Icons.send_outlined, color: Style.imageColor, size: 15),
    10: const Icon(Icons.send_outlined, color: Style.videoColor, size: 15),
    11: const Icon(Icons.send_outlined, color: Style.chatColor, size: 15),
    12: const Icon(Icons.call_end_rounded, color: Style.chatColor, size: 15),
    13: const Icon(Icons.call, color: Style.chatColor, size: 15),
    14: const Icon(Icons.call_missed, color: Style.chatColor, size: 15),
  };
}