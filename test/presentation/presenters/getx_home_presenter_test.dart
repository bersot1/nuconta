import 'package:nuconta/domain/helpers/helpers.dart';
import 'package:nuconta/domain/usecases/clear_current_user.dart';
import 'package:nuconta/domain/usecases/get_current_balance.dart';
import 'package:nuconta/domain/usecases/http_link.dart';
import 'package:nuconta/domain/usecases/save_current_ballance.dart';
import 'package:nuconta/presentation/presenters/getx_home_presenter.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class HttpLinkSpy extends Mock implements IHttpLink {}

class GetCurrentBalanceSpy extends Mock implements IGetCurrentBalance {}

class LocalSaveBalanceSpy extends Mock implements ISaveCurrentBalance {}

class ClearCurrentUserSpy extends Mock implements IClearCurrentUser {}

main() {
  late HttpLinkSpy httpLinkSpy;
  late GetCurrentBalanceSpy getCurrentBalanceSpy;
  late LocalSaveBalanceSpy localSaveBalanceSpy;
  late ClearCurrentUserSpy clearCurrentUserSpy;
  late GetxHomePresenter sut;
  late double _ballance;

  void mockCallSaveBalanceError(DomainError error) =>
      when(() => localSaveBalanceSpy.save(_ballance)).thenThrow(error);

  setUp(() {
    httpLinkSpy = HttpLinkSpy();
    getCurrentBalanceSpy = GetCurrentBalanceSpy();
    localSaveBalanceSpy = LocalSaveBalanceSpy();
    clearCurrentUserSpy = ClearCurrentUserSpy();
    _ballance = faker.randomGenerator.decimal();
    sut = GetxHomePresenter(
      httpLink: httpLinkSpy,
      getCurrenteBalance: getCurrentBalanceSpy,
      localSaveBalance: localSaveBalanceSpy,
      clearCurrentUser: clearCurrentUserSpy,
    );
  });

  test('Should call saveBallance with correct value', () async {
    await sut.saveBalance(_ballance);

    verify(() => localSaveBalanceSpy.save(_ballance));
  });

  test('Should emit balance event on save is success', () async {
    sut.ballanceStream
        ?.listen(expectAsync1((balance) => expect(balance, _ballance)));

    await sut.saveBalance(_ballance);
  });

  test('Should throws UnexpectedError if fails', () async {
    mockCallSaveBalanceError(DomainError.unexpected);

    sut.mainErrorStream?.listen(expectAsync1((error) =>
        expect(error, 'Algo errado aconteceu. Tente novamente em breve.')));

    await sut.saveBalance(_ballance);
  });

  test('Should navigato to login when call logout', () async {
    when(() => clearCurrentUserSpy.clear()).thenAnswer((_) async => null);
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/login')));

    await sut.logout();
  });
}
