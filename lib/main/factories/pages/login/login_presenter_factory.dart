import '../../../../main/factories/pages/pages.dart';
import '../../../../main/factories/usecases/usecases.dart';
import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/ui.dart';

ILoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
      validation: makeLoginValidation(), saveCurrentCpf: makeSaveCurrentCPF());
}
