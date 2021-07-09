import '../../../data/usecases/usecases.dart';

import '../../../domain/domain.dart';

import '../../../main/factories/cache/cache.dart';

ISaveCurrentCpf makeSaveCurrentCPF() {
  return LocalSaveCpf(saveSecureCacheStorage: makeSaveSecureCacheStorage());
}
