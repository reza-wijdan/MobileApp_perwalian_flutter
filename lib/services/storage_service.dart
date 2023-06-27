import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  final String tokenKey = 'auth_token';

  Future<String?> readToken() async {
    return await secureStorage.read(key: tokenKey);
  }
}