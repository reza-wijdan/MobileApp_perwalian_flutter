import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guardianship_siswa_fe/constants/color.dart';
import 'package:guardianship_siswa_fe/views/components/%20CardMenunggu.dart';
import 'package:guardianship_siswa_fe/views/components/CardPerwalian.dart';

class NotifKonfir extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyNotifKonfirState();
  }
}

class _MyNotifKonfirState extends State<NotifKonfir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/bg-perwalian.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // child: Image.asset(
                //   "images/abs.png",
                //   fit: BoxFit.cover,
                // ),
                decoration: BoxDecoration(color: app),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/images/garis.svg"),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: CardMenunggu(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
