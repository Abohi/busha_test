import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../utils/_export_.dart';

class SecureStorage {
  late FlutterSecureStorage _storage;

  SecureStorage({FlutterSecureStorage? storage}) {
    _storage = storage ?? const FlutterSecureStorage();
  }

  Future<bool> delete(String key) async {
    try {
      await _storage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      AppLogger.log(e);
    }
    return null;
  }

  Future<void> write({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      AppLogger.log(e);
    }
  }
}
