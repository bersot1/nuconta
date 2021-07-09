import 'package:nuconta/data/cache_secure/cache_secure.dart';
import 'package:nuconta/data/usecases/usecases.dart';
import 'package:nuconta/domain/helpers/helpers.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class SecureCacheStorageSpy extends Mock implements ISecureCacheStorage {}

main() {
  late SecureCacheStorageSpy secureCacheStorageSpy;
  late LocalGetBalance sut;

  void mockLocalGetBallanceError() =>
      when(() => secureCacheStorageSpy.getSecure(key: any(named: 'key')))
          .thenThrow(Exception());

  setUp(() {
    secureCacheStorageSpy = SecureCacheStorageSpy();
    sut = LocalGetBalance(secureCacheStorage: secureCacheStorageSpy);
  });

  test('Should call LocalGetBallance with correct values', () async {
    await sut.getBalance();

    verify(() => secureCacheStorageSpy.getSecure(key: 'ballance'));
  });

  test('Should throw UnexpectedError if LocalGetBallance throws', () async {
    mockLocalGetBallanceError();
    final result = sut.getBalance();

    expect(result, throwsA(DomainError.unexpected));
  });
}
