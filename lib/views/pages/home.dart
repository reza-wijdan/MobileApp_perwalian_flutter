import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guardianship_siswa_fe/constants/color.dart';
import 'package:guardianship_siswa_fe/services/api_services.dart';
import 'package:guardianship_siswa_fe/views/components/CardPerwalian.dart';
import 'package:guardianship_siswa_fe/views/components/CardSelesai.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomeState();
  }
}

class _MyHomeState extends State<Home> {
  Map<String, dynamic>? data;
  int statusCode = 0;

  void initState() {
    fetchData();    
    super.initState();
  }


  Future<void> fetchData() async {
    try {
      final jsonData = await ApiService().fetchData();
      final status = jsonData['status'];

      setState(() {
        statusCode = status['code'];
      });
    } catch (error) {
      print(error.toString());
      setState(() {
        statusCode = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(statusCode);
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/profile-man.svg",
                    width: 55,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Hai, Selamat Datang",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  )
                ],
              ),
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
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: appCardNotif,
                                border: Border.all(
                                  width: 1,
                                  color: appCardBorder,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/ic_pay.svg"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                      child: Text(
                                    "Perwalian untuk semester ganjil sudah tersedia. Lakukan pembayaran terlebih dahulu ke bagian keuangan.",
                                    style: TextStyle(fontSize: 12),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: SvgPicture.asset(
                                        "assets/images/ic_warning.svg"),
                                  )
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: statusCode == 200 ? CardSelesai() : CardPerwalian(),
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
