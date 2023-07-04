import 'package:flutter/material.dart';
import 'package:guardianship_siswa_fe/model/sendMatkul.dart';
import 'package:guardianship_siswa_fe/services/api_services.dart';

class SendViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  Future<void> sendMatkul(List<SendMatkul> sendmatkul) async {
    try {
      await _apiService.sendMatkul(sendmatkul);
    } catch (error) {
      // Gagal melakukan posting data, lakukan penanganan error
    }
  }
}
