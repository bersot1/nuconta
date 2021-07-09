import 'package:nuconta/data/cache_secure/cache_secure.dart';
import 'package:nuconta/data/usecases/usecases.dart';
import 'package:nuconta/domain/helpers/helpers.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class SecureCacheStorageSpy extends Mock implements ISecureCacheStorage {}

main() {
  late SecureCacheStorageSpy secureCacheStorageSpy;
  late LocalGetCpf sut;

  void mockLocalGetCpf() =>
      when(() => secureCacheStorageSpy.getSecure(key: any(named: 'key')))
          .thenThrow(Exception());

  setUp(() {
    secureCacheStorageSpy = SecureCacheStorageSpy();
    sut = LocalGetCpf(secureCacheStorage: secureCacheStorageSpy);
  });

  test('Should call LocalGetCpf with correct values', () async {
    await sut.get();

    verify(() => secureCacheStorageSpy.getSecure(key: 'cpf'));
  });

  test('Should throws UnexpectedError if LocalGetCpf throws', () async {
    mockLocalGetCpf();
    final result = sut.get();
    expect(result, throwsA(DomainError.unexpected));
  });
}
