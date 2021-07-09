import '../../../../main/factories/usecases/usecases.dart';

import '../../../../presentation/presenters/presenters.dart';

import '/ui/ui.dart';

IHomePresenter makeHomePresenterFactory() {
  return GetxHomePresenter(
      httpLink: makeHttpLinkFactory(),
      getCurrenteBalance: makeGetCurrentBalanceFactory(),
      localSaveBalance: makeSaveCurrentBallanceFactory(),
      clearCurrentUser: makeClearCurrentUserFactory());
}
