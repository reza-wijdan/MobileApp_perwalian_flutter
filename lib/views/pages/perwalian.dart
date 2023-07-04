import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guardianship_siswa_fe/constants/color.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:guardianship_siswa_fe/model/matkul.dart';
import 'package:guardianship_siswa_fe/model/select.dart';
import 'package:guardianship_siswa_fe/services/api_services.dart';
import 'package:guardianship_siswa_fe/viewModel/matkulViewModel.dart';
import 'package:guardianship_siswa_fe/views/components/chekbox.dart';
import 'package:guardianship_siswa_fe/views/pages/detailPerwalian.dart';

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
  List<SelectedItem> selectItem = [];
  bool _isChecked = false;
  final storage = FlutterSecureStorage();

  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    matkul = await apiService.getMatkul();

    setState(() {});
  }

  addToStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  void handleTapItem(int id, String name, int sks) async {
    if (isSelected(id)) {
      selectItem.remove((item) => item.id == item.id);
    } else {
      selectItem.add(SelectedItem(id: id, name: name, sks: sks));
    }
  }

   int get calculateTotalSKS {
    int totalSKS = 0;
    for (var item in selectItem) {
      totalSKS += item.sks;
    }
    print('Total SKS: $totalSKS');
    return totalSKS;
  }
  
  

  void saveDataToStorage() async {
    // Mengonversi List menjadi String menggunakan json.encode
    String selectedItemsString = selectItem.toString();

    // Menyimpan List selectedItems ke storage dengan menggunakan satu key
    await storage.write(key: 'selectedMatkul', value: selectedItemsString);
  }

  bool isSelected(int id) {
    return selectItem.any((item) => item.id == id);
  }


  checkStorageContents() async {
    final secureStorage = FlutterSecureStorage();
    final allValues = await secureStorage.readAll();

    if (allValues.isNotEmpty) {
      // Storage is not empty, print the contents
      allValues.forEach((key, value) {
        print('$key: $value');
      });
    } else {
      // Storage is empty
      print('Storage is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(calculateTotalSKS);
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
                          const Text(
                            "Perwalian",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                      SvgPicture.asset("assets/images/ic_perwalian.svg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
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
                          padding: EdgeInsets.only(bottom: 0),
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
                            final item = matkul[index];
                            return CustomCheckbox(
                              name: matkul[index].name,
                              sks: matkul[index].sks,
                              selected: _isChecked,
                              onTap: () {
                                handleTapItem(matkul[index].id,
                                    matkul[index].name, matkul[index].sks);

                                String dataMatkul = selectItem.join(',');
                                storage
                                    .write(key: 'dataMatkul', value: dataMatkul)
                                    .then((_) {
                                  // Data is successfully stored
                                  print('Data stored successfully');
                                }).catchError((error) {
                                  // Error occurred while storing data
                                  print('Error storing data: $error');
                                });
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                         Text(
                          'Jumlah SKS : ${calculateTotalSKS}',
                          style: TextStyle(color: Color(0xFFAFAFAF)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPerwalian(
                                      selectedItems: selectItem),
                                ),
                              );
                              saveDataToStorage();
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
