import 'package:nuconta/domain/usecases/usecases.dart';
import 'package:nuconta/presentation/presenters/presenters.dart';
import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class GetCurrentCpfSpy extends Mock implements IGetCurrentCpf {}

main() {
  late GetCurrentCpfSpy getCurrentCpfSpy;
  late GetxScreenPagePresenter sut;
  late String cpf;

  void mockLoadCurrentUser(String? value) =>
      when(() => getCurrentCpfSpy.get()).thenAnswer((_) async => value);

  void mockLoadCurrentUserError() =>
      when(() => getCurrentCpfSpy.get()).thenThrow(Exception());

  setUp(() {
    getCurrentCpfSpy = GetCurrentCpfSpy();
    sut = GetxScreenPagePresenter(getCurrentCpf: getCurrentCpfSpy);
    cpf = faker.guid.guid();
    mockLoadCurrentUser(cpf);
  });

  test('Should call CheckLoggedUser', () async {
    await sut.loadCurrentUser();

    verify(() => getCurrentCpfSpy.get()).called(1);
  });

  test('Should go to login page if dont exist current user', () async {
    mockLoadCurrentUser(null);
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/login')));

    await sut.loadCurrentUser();
  });

  test('Should go to home page if exists current user', () async {
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/home')));

    await sut.loadCurrentUser();
  });

  test('Should go to login page on error', () async {
    mockLoadCurrentUserError();
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/login')));

    await sut.loadCurrentUser();
  });
}
