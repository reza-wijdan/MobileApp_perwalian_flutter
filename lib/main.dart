import 'package:flutter/material.dart';
import 'package:guardianship_siswa_fe/views/login/login.dart';
import 'package:guardianship_siswa_fe/views/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      initialRoute: '/loginpage',
      routes: {
        '/home':(context) => Home(),
      }
    );
  }
}