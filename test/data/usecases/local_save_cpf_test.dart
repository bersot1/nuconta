import 'package:nuconta/data/cache_secure/cache_secure.dart';
import 'package:nuconta/data/usecases/usecases.dart';
import 'package:nuconta/domain/helpers/helpers.dart';

import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class SecureCacheStorageSpy extends Mock implements ISecureCacheStorage {}

main() {
  late SecureCacheStorageSpy secureCacheStorageSpy;
  late LocalSaveCpf sut;

  late String cpf;

  void mockLocalSaveCpfError() => when(() => secureCacheStorageSpy.saveSecure(
      key: any(named: 'key'),
      value: any(named: 'value'))).thenThrow(Exception());

  setUp(() {
    secureCacheStorageSpy = SecureCacheStorageSpy();
    sut = LocalSaveCpf(saveSecureCacheStorage: secureCacheStorageSpy);
    cpf = faker.guid.guid();
  });

  test(
    'Should call LocalSaveCpf with correct values',
    () async {
      await sut.saveSecure(cpf);
      verify(() async =>
          await secureCacheStorageSpy.saveSecure(key: 'cpf', value: cpf));
    },
  );

  test('Should throw UnexpectedError if LocalSaveCPF throws', () async {
    mockLocalSaveCpfError();

    final future = sut.saveSecure(cpf);

    expect(future, throwsA(DomainError.unexpected));
  });
}
