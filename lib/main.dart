import 'package:flutter/material.dart';
import 'screens/LoadingScreen.dart';
import'screens/HomeScreen.dart';



void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.yellowAccent,
        brightness: Brightness.dark,
        canvasColor: Colors.transparent
      ),
        home:Home(),
    );
  }
}
