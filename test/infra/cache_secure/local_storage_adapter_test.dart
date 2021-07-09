import 'package:nuconta/infra/cache_secure/cache_secure.dart';
import 'package:faker/faker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FlutterSecureStorageSpy extends Mock implements FlutterSecureStorage {}

main() {
  late String key;
  late String value;

  late FlutterSecureStorageSpy secureStorageSpy;

  late SecureCacheStorageAdapter sut;
  // late FlutterSecureStorage secureStorage;

  setUp(() {
    secureStorageSpy = FlutterSecureStorageSpy();
    sut = SecureCacheStorageAdapter(secureStorage: secureStorageSpy);
    key = faker.lorem.word();
    value = faker.lorem.word();
  });

  group('Save', () {
    void mockSaveSecureError() => when(() => secureStorageSpy.write(
        key: any(named: 'key'),
        value: any(named: 'value'))).thenThrow(Exception());

    test('Should call saveSecure with correct values', () async {
      await sut.saveSecure(key: key, value: value);

      verify(() => secureStorageSpy.write(key: key, value: value));
    });

    test('Should throw if save secura throws', () async {
      mockSaveSecureError();

      final future = sut.saveSecure(key: key, value: value);

      expect(future, throwsA(const TypeMatcher<Exception>()));
    });
  });

  group('get', () {
    When mockGetSecureCall() =>
        when(() => secureStorageSpy.read(key: any(named: 'key')));

    void mockGetSecure() => mockGetSecureCall().thenAnswer((_) async => value);

    void mockGetSecureError() => mockGetSecureCall().thenThrow(Exception());

    test("Should call getSecure with correct values", () async {
      await sut.getSecure(key: key);

      verify(() => secureStorageSpy.read(key: key));
    });

    test('Should return correct value on success', () async {
      mockGetSecure();

      final future = await sut.getSecure(key: key);

      expect(future, value);
    });

    test('Should throw if get throws', () {
      mockGetSecureError();

      final future = sut.getSecure(key: key);

      expect(future, throwsA(const TypeMatcher<Exception>()));
    });
  });

  group('clear', () {
    void mockClearSecureError() =>
        when(() => secureStorageSpy.deleteAll()).thenThrow(Exception());

    test('Should throw if clear throws', () {
      mockClearSecureError();

      final future = sut.clearSecure();

      expect(future, throwsA(const TypeMatcher<Exception>()));
    });
  });
}
