import 'package:flutter/material.dart';
import 'package:travel_app_ui/constants.dart';
import 'package:travel_app_ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Nature',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Lato",
        textTheme: TextTheme(
            headline6: TextStyle(
                fontFamily: "PlayfairDisplay",
                fontSize: defaultPadding * 2.5,
                fontWeight: FontWeight.w700)),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

