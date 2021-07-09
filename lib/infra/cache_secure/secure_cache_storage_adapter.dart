import '../../data/cache_secure/cache_secure.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheStorageAdapter implements ISecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  SecureCacheStorageAdapter({required this.secureStorage});

  Future<void> saveSecure({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> getSecure({required String key}) async {
    return await secureStorage.read(key: key);
  }

  Future<void> clearSecure() async {
    await secureStorage.deleteAll();
  }
}
