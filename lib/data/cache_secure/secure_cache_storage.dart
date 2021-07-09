abstract class ISecureCacheStorage {
  Future<void>? saveSecure({
    required String key,
    required String value,
  });

  Future<String?>? getSecure({required String key});

  Future<void>? clearSecure();
}
