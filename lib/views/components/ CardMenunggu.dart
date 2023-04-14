import 'package:flutter/material.dart';
import 'package:guardianship_siswa_fe/constants/color.dart';
import 'package:flutter_svg/svg.dart';

class CardMenunggu extends StatelessWidget {
  const CardMenunggu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appBlueSoft,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text("MENUNGGU KONFIRMASI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            SizedBox(height: 40,),
            SvgPicture.asset(
                "assets/images/ic_pesawat.svg"),
            SizedBox(
              height: 40,
            ),
            Text("Status perwalian kamu belum dikonfirmasi, Hubungi dosen wali kamu untuk menyelesaikan proses perwalian.", style: TextStyle(fontSize: 14),),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(
                          appBlue),
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30.0),
                    ),
                  ),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15)),
                ),
                child: Text(
                  'SELESAI',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}