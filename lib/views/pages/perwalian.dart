import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guardianship_siswa_fe/constants/color.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:guardianship_siswa_fe/views/components/chekbox.dart';

class Perwalian extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PerwalianState();
  }
}

class _PerwalianState extends State<Perwalian> {
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.arrow_back),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Perwalian",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                      SvgPicture.asset("assets/images/ic_perwalian.svg"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: ["2021/2022", "2022/2023"],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        fillColor: Colors.black,
                        labelText: "Tahun Akademik",
                        hintText: "Pilih Tahun Akademik",
                      ),
                    ),
                    onChanged: print,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 225),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  // child: Image.asset(
                  //   "images/abs.png",
                  //   fit: BoxFit.cover,
                  // ),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      padding: EdgeInsets.only(top: 20),
                      children: [
                        Text(
                          "Mata Kuliah",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFFAFAFAF)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text(
                            "Maksimal 22 SKS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        CustomCheckbox(),
                        CustomCheckbox(),
                        CustomCheckbox(),
                        CustomCheckbox(),
                        CustomCheckbox(),
                        CustomCheckbox(),
                        CustomCheckbox(),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Jumlah SKS : 20",
                          style: TextStyle(color: Color(0xFFAFAFAF)),
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/detail_perwalian');
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(appBlue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 18)),
                            ),
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
