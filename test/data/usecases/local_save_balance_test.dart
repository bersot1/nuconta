import 'package:nuconta/data/cache_secure/cache_secure.dart';
import 'package:nuconta/data/usecases/usecases.dart';
import 'package:nuconta/domain/helpers/helpers.dart';
import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class SecureCacheStorageSpy extends Mock implements ISecureCacheStorage {}

main() {
  late SecureCacheStorageSpy secureCacheStorageSpy;
  late LocalSaveBalance sut;
  late double ballance;

  void mockLocalSaveError() => when(() => secureCacheStorageSpy.saveSecure(
      key: any(named: 'key'),
      value: any(named: 'value'))).thenThrow(Exception());

  setUp(() {
    secureCacheStorageSpy = SecureCacheStorageSpy();
    sut = LocalSaveBalance(secureCacheStorage: secureCacheStorageSpy);
    ballance = faker.randomGenerator.decimal();
  });

  test('Should call LocalSaveBallance with correct values', () async {
    await sut.save(ballance);

    verify(() => secureCacheStorageSpy.saveSecure(
        key: 'ballance', value: ballance.toString()));
  });

  test('Should throw UnexpectedError if LocalSaveBallance throws', () async {
    mockLocalSaveError();

    final result = sut.save(ballance);

    expect(result, throwsA(DomainError.unexpected));
  });
}
