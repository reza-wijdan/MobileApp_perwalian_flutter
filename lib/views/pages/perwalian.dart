import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guardianship_siswa_fe/constants/color.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:guardianship_siswa_fe/model/matkul.dart';
import 'package:guardianship_siswa_fe/services/api_services.dart';
import 'package:guardianship_siswa_fe/viewModel/matkulViewModel.dart';
import 'package:guardianship_siswa_fe/views/components/chekbox.dart';

class Perwalian extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PerwalianState();
  }
}

class _PerwalianState extends State<Perwalian> {
  ApiService apiService = ApiService();
  late MatkulViewModel matkulViewModel;
  List<Matkul> matkul = [];

  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    matkul = await apiService.getMatkul();
    setState(() {});
  }

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
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //   child: DropdownSearch<String>(
                //     popupProps: PopupProps.menu(
                //       showSelectedItems: true,
                //       disabledItemFn: (String s) => s.startsWith('I'),
                //     ),
                //     items: ["2021/2022", "2022/2023"],
                //     dropdownDecoratorProps: const DropDownDecoratorProps(
                //       dropdownSearchDecoration: InputDecoration(
                //         fillColor: Colors.black,
                //         labelText: "Tahun Akademik",
                //         hintText: "Pilih Tahun Akademik",
                //       ),
                //     ),
                //     onChanged: print,
                //   ),
                // )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
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
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      padding: const EdgeInsets.only(top: 20),
                      children: [
                        const Text(
                          "Mata Kuliah",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFFAFAFAF)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(bottom: 0),
                          child: Text(
                            "Maksimal 22 SKS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: matkul.length,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomCheckbox(
                                name: matkul[index].name, sks: matkul[index].sks);
                          },
                        ),
                        // Center(
                        //   child: 
                        //     ListView.builder(
                        //       itemBuilder: (context, index) {
                        //         return CustomCheckbox(name: "matkul", sks: 1);
                        //       },
                        //       itemCount: 10,
                        //     ),
                        // ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Jumlah SKS : 20",
                          style: TextStyle(color: Color(0xFFAFAFAF)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/detail_perwalian');
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
                                  const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 18)),
                            ),
                            child: const Text(
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
