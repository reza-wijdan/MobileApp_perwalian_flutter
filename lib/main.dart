import 'package:flutter/material.dart';
import 'package:guardianship_siswa_fe/views/login/login.dart';
import 'package:guardianship_siswa_fe/views/pages/detailPerwalian.dart';
import 'package:guardianship_siswa_fe/views/pages/home.dart';
import 'package:guardianship_siswa_fe/views/pages/notifKonfir.dart';
import 'package:guardianship_siswa_fe/views/pages/perwalian.dart';

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
        '/perwalian':(context) => Perwalian(),
        // '/detail_perwalian':(context) => DetailPerwalian(),
        '/notif_konfir':(context) => NotifKonfir()
      }
    );
  }
}