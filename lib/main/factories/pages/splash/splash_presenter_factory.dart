import '../../../../main/factories/usecases/usecases.dart';

import '../../../../presentation/presenters/presenters.dart';

import '../../../../ui/pages/splash_screen/splash_screen.dart';

ISplashScreenPresenter makeGetxSplashPresenter() {
  return GetxScreenPagePresenter(getCurrentCpf: makeGetCurrentCpf());
}
