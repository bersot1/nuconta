import '../../domain/helpers/helpers.dart';

import '../cache_secure/cache_secure.dart';

import '../../domain/domain.dart';

class LocalSaveCpf implements ISaveCurrentCpf {
  final ISecureCacheStorage saveSecureCacheStorage;

  LocalSaveCpf({required this.saveSecureCacheStorage});

  @override
  Future<void> saveSecure(String value) async {
    try {
      await saveSecureCacheStorage.saveSecure(key: 'cpf', value: value);
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
