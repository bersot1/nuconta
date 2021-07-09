import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/cache_secure/cache_secure.dart';

class SecureCacheStorageAdapter implements ISecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  SecureCacheStorageAdapter({required this.secureStorage});

  @override
  Future<void> saveSecure({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> getSecure({required String key}) async {
    return await secureStorage.read(key: key);
  }

  @override
  Future<void> clearSecure() async {
    await secureStorage.deleteAll();
  }
}
