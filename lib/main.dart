import 'package:flutter/material.dart';
import 'package:habit_app_front/screens/LoginPage.dart';
import 'package:habit_app_front/screens/SignpPage.dart';
import 'package:habit_app_front/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';


import 'app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Habit",
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kScaffoldBackground,
      ),
      initialRoute: "/",
      routes: {
        // "/":(context)=>const Homepage()
        "/":(context) =>const SignUpPage(),
        "/login":(context)=>const LoginPage(), 
      },
    );
  }
}
 


