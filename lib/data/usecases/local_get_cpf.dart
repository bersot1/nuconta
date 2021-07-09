import '../../domain/helpers/helpers.dart';

import '../../domain/usecases/usecases.dart';
import '../cache_secure/cache_secure.dart';

class LocalGetCpf implements IGetCurrentCpf {
  final ISecureCacheStorage secureCacheStorage;

  LocalGetCpf({required this.secureCacheStorage});

  @override
  Future<String?> get() async {
    try {
      return await secureCacheStorage.getSecure(key: 'cpf');
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
