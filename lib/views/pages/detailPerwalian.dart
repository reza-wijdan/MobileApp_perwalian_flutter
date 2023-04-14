import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guardianship_siswa_fe/constants/color.dart';

class DetailPerwalian extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailPerwalianState();
  }
}

class _DetailPerwalianState extends State<DetailPerwalian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/bg-hal.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.arrow_back_ios),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Detail Perwalian",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Semester Ganjil 2023-2024", style: TextStyle(fontSize: 12),)
                            ],
                          )
                        ],
                      ),
                      SvgPicture.asset("assets/images/ic_perwalian.svg"),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/ic_peringatan.svg"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Periksa kembali mata kuliah dan jumlah sks kamu.",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFAFAFAF),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mata Kuliah",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("SKS",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Matkul(
                            name: "Dasar Pemograman 2",
                            sks: "2",
                          ),
                          Matkul(
                            name: "Matematika Diskrit",
                            sks: "3",
                          ),
                          Matkul(
                            name: "Sistem Operasi",
                            sks: "4",
                          ),
                          Matkul(
                            name: "Artificial Intelligence",
                            sks: "2",
                          ),
                          Matkul(
                            name: "Distributed Computing",
                            sks: "3",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: SvgPicture.asset(
                              "assets/images/Line1.svg",
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Jumlah Mata Kuliah : 5",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                                Text("Jumalah SKS : 14",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/notif_konfir');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(appBlue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 120, vertical: 18)),
                      ),
                      child: Text(
                        'LANJUTKAN',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Matkul extends StatelessWidget {
  const Matkul({
    required this.name,
    required this.sks,
    super.key,
  });

  final String name;
  final String sks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(sks),
          ),
        ],
      ),
    );
  }
}
