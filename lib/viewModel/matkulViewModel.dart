import 'package:flutter/material.dart';
import 'package:guardianship_siswa_fe/model/matkul.dart';
import 'package:guardianship_siswa_fe/services/api_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guardianship_siswa_fe/services/storage_service.dart';
import 'package:guardianship_siswa_fe/views/pages/perwalian.dart';

class MatkulViewModel {
  final ApiService apiService;

  MatkulViewModel(this.apiService);

  List<Matkul> matkul = [];

  // Future<void> getMatkul() async {
  //   try {
  //     final storage = FlutterSecureStorage();
  //     final token = await storage.read(key: 'auth_token');

  //     if (token != null) {
  //       var fetchedMatkul = await ApiService.getMatkul(token);
  //       _matkul = fetchedMatkul;
  //       print(_matkul);
  //       notifyListeners();
  //     } else {
  //       throw Exception('Token not found');
  //     }
  //   } catch (error) {
  //     print('Failed to get matkul: $error');
  //   }
  // }
  Future<void> getMatkul() async {
    try {
     matkul = await apiService.getMatkul();
    } catch (error) {
      print('Failed to get matkul: $error');
    }
  }
}

