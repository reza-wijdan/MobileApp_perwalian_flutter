import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guardianship_siswa_fe/constants/color.dart';
import 'package:guardianship_siswa_fe/model/matkul.dart';
import 'package:guardianship_siswa_fe/model/select.dart';
import 'package:guardianship_siswa_fe/model/sendMatkul.dart';
import 'package:guardianship_siswa_fe/viewModel/sendViewModel.dart';


class DetailPerwalian extends StatefulWidget {
    final List<SelectedItem> selectedItems;

  @override
  _DetailPerwalian createState() => _DetailPerwalian();
    const DetailPerwalian({required this.selectedItems});

}
class _DetailPerwalian extends State<DetailPerwalian> {

void initState() {
    checkStorageContents();
    super.initState();
  }

  int get calculateTotalSKS {
    int totalSKS = 0;
    for (var item in widget.selectedItems) {
      totalSKS += item.sks;
    }
    print('Total SKS: $totalSKS');
    return totalSKS;
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
    print(checkStorageContents());
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          setState(() {
                            // Menghapus data yang dipilih
                            widget.selectedItems.clear();
                          });
                        },
                        child: Row(
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Semester Ganjil 2023-2024",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
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
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.selectedItems.length,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = widget.selectedItems[index];
                              return MatkulDetail(
                                name: widget.selectedItems[index].name,
                                sks: widget.selectedItems[index].sks,
                              );
                            },
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text("Jumalah SKS : ${calculateTotalSKS}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12))
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
                      onPressed: () {},
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
                            EdgeInsets.symmetric(
                                horizontal: 120, vertical: 18)),
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

class MatkulDetail extends StatelessWidget {
  const MatkulDetail({
    required this.name,
    required this.sks,
    super.key,
  });

  final String name;
  final int sks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(name),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text("${sks}"),
          ),
        ],
      ),
    );
  }
}
