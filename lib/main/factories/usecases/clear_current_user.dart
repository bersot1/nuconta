import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../main/factories/cache/cache.dart';

IClearCurrentUser makeClearCurrentUserFactory() {
  return LocalClear(secureCacheStorage: makeSaveSecureCacheStorage());
}
