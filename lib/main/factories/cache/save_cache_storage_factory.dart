import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data/cache_secure/cache_secure.dart';

import '../../../infra/cache_secure/cache_secure.dart';

ISecureCacheStorage makeSaveSecureCacheStorage() {
  final secureStorage = FlutterSecureStorage();
  return SecureCacheStorageAdapter(secureStorage: secureStorage);
}
