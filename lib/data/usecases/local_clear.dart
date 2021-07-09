import '../../data/cache_secure/cache_secure.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

class LocalClear implements IClearCurrentUser {
  final ISecureCacheStorage secureCacheStorage;

  LocalClear({required this.secureCacheStorage});

  @override
  Future<void> clear() async {
    try {
      await secureCacheStorage.clearSecure();
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
