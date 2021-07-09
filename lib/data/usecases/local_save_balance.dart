import '../../data/cache_secure/cache_secure.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

class LocalSaveBalance implements ISaveCurrentBalance {
  final ISecureCacheStorage secureCacheStorage;

  LocalSaveBalance({required this.secureCacheStorage});

  @override
  Future<void> save(double ballance) async {
    try {
      return await secureCacheStorage.saveSecure(
          key: 'ballance', value: ballance.toString());
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
