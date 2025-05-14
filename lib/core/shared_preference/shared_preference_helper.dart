import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // إنشاء instance واحدة من secure storage
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // مفتاح التخزين
  static const String _tokenKey = 'auth_token';

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }

}
