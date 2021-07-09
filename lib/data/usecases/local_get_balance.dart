import '../../data/cache_secure/cache_secure.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

class LocalGetBalance implements IGetCurrentBalance {
  final ISecureCacheStorage secureCacheStorage;

  LocalGetBalance({required this.secureCacheStorage});

  @override
  Future<double> getBalance() async {
    try {
      final result = await secureCacheStorage.getSecure(key: 'ballance');
      final ballance = result != null ? double.parse(result) : 0.0;
      return ballance;
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
