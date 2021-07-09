import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/ui.dart';

import '../../../../main/factories/pages/pages.dart';
import '../../../../main/factories/usecases/usecases.dart';

ILoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
      validation: makeLoginValidation(), saveCurrentCpf: makeSaveCurrentCPF());
}
