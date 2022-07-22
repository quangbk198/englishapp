import 'package:englishapp/page/landing_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'English app',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: LandingPage(),
    );
  }
}
