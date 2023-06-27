import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../model/login.dart';
import 'dart:convert';

class LoginViewModel {
  String apiUrl = 'http://absensi-siswa-be.sagatech-alpha.com/api/siswa/login';
  final _storage = new FlutterSecureStorage();

  Future<void> authenticateUser(Login login) async {
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: {
        'username': login.username,
        'password': login.password,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      Map<String, dynamic> data = jsonData['data'];
      Map<String, dynamic> results = data['results'];
      String token = results['__token'];
      await _storage.write(key: 'auth_token', value: token);
    } else {
      // login failed
      throw Exception('Failed to authenticate user');
    }
  }

  Future<bool> isLoggedIn() async {
    var token = await _storage.read(key: 'token');
    return token != null;
  }
}
