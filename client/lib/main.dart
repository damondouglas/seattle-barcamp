import 'package:barcamp/pages/faq.dart';
import 'package:barcamp/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final themeData = ThemeData(
  fontFamily: 'Montserrat',
  appBarTheme: AppBarTheme(
    color: Color(0xFFFFF7),
  ),
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          color: Color(0xFFFFF7),
        ),
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 15.0,
          ),
          title: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          )
        )
      ),
      title: 'BarCamp Seattle 2019',
      routes: {
        '/': (context) => HomePage(),
        '/faq': (context) => FaqPage(),
      },
    );
  }
}

