import 'package:nuconta/data/cache_secure/cache_secure.dart';
import 'package:nuconta/data/usecases/usecases.dart';
import 'package:nuconta/domain/helpers/helpers.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class SecureCacheStorageSpy extends Mock implements ISecureCacheStorage {}

main() {
  late SecureCacheStorageSpy secureCacheStorageSpy;
  late LocalClear sut;

  void mockLocalClearError() =>
      when(() => secureCacheStorageSpy.clearSecure()).thenThrow(Exception());

  setUp(() {
    secureCacheStorageSpy = SecureCacheStorageSpy();
    sut = LocalClear(secureCacheStorage: secureCacheStorageSpy);
  });

  test('Should throw UnexpectedError if clear fails', () async {
    mockLocalClearError();
    final result = sut.clear();
    expect(result, throwsA(DomainError.unexpected));
  });
}
