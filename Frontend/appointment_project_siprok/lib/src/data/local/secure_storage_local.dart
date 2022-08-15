import 'package:appointment_project_siprok/src/domain/repositories/secure_storage_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageLocal implements SecureStorageRepository {
  const SecureStorageLocal();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static String? _jwtToken;

  @override
  Future<String?> get jwtToken async {
    return _jwtToken ??= await _storage.read(key: 'jwtToken');
  }

  @override
  Future<void> saveJWTToken(String? token) async {
    _jwtToken = token == null ? null : 'Bearer $token';
    return _storage.write(key: 'jwtToken', value: _jwtToken);
  }
}
