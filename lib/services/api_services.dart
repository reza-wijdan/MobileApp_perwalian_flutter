import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guardianship_siswa_fe/model/sendMatkul.dart';
import 'package:http/http.dart' as http;
import 'package:guardianship_siswa_fe/model/matkul.dart';

class ApiService {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<String> getTokenFromStorage() async {
    final token = await secureStorage.read(key: 'auth_token');
    if (token == null) {
      throw Exception('Token not found in storage');
    }
    return token;
  }

  Future<String> getIdFromStorage() async {
    final idMatkul = await secureStorage.read(key: 'selectedMatkul');
    if (idMatkul == null) {
      throw Exception('matkul tidak ada');
    }
    return idMatkul;
  }

  Future<List<Matkul>> getMatkul() async {
    final token = await getTokenFromStorage();
    final url =
        'http://absensi-siswa-be.sagatech-alpha.com/api/siswa/perwalian';

    final response = await http.get(
      Uri.parse(url),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    final jsonData = json.decode(response.body);
    var data = jsonData['result'];
    print(data);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['result'];
      final List<Matkul> matkul = data
          .map((data) =>
              Matkul(id: data['id'], name: data['name'], sks: data['sks']))
          .toList();
      return matkul;
    } else {
      throw Exception('Failed to get');
    }
  }

  Future<void> sendMatkul(SendMatkul sendMatkuliah) async {
    final token = await getTokenFromStorage();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${token}',
    };

    var sendMatkulRequest = {
      "list_matakuliah": sendMatkuliah.list_matakuliah,
    };
    print(sendMatkulRequest);

    var response = await http.post(
      Uri.parse(
          'http://absensi-siswa-be.sagatech-alpha.com/api/siswa/perwalian/create'),
      headers: headers,
      body: jsonEncode(sendMatkulRequest),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }
}
