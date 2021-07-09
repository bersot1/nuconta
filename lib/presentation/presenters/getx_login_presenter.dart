import 'package:get/state_manager.dart';

import '../../../../domain/domain.dart';
import '../../../../domain/helpers/helpers.dart';
import '../../ui/ui.dart';
import '../../validation/validation.dart';
import '../mixins/mixins.dart';

class GetxLoginPresenter extends GetxController
    with NavigationManager
    implements ILoginPresenter {
  final IValidation validation;
  final ISaveCurrentCpf saveCurrentCpf;

  GetxLoginPresenter({
    required this.validation,
    required this.saveCurrentCpf,
  });

  late String _cpf;

  final _cpfError = RxnString();
  final _mainError = RxnString();

  final _isFormValid = false.obs;
  final _isLoading = false.obs;

  @override
  Stream<String?>? get cpfErrorStream => _cpfError.stream;
  @override
  Stream<String?>? get mainErrorStream => _mainError.stream;

  @override
  Stream<bool?>? get isFormValidStream => _isFormValid.stream;
  @override
  Stream<bool?>? get isLoadingStream => _isLoading.stream;

  @override
  void validateCPF(String cpf) {
    _cpf = cpf;
    _cpfError.value = validation.validate(field: 'cpf', value: cpf);
    _validateForm();
  }

  @override
  Future<void> auth() async {
    _isLoading.value = true;
    try {
      await saveCurrentCpf.saveSecure(_cpf);
      Future.delayed(const Duration(seconds: 3), () async {
        _isLoading.value = false;
        navigateTo = '/home';
      });
    } on DomainError catch (e) {
      _mainError.value = e.description;
    }
  }

  void _validateForm() {
    _isFormValid.value = _cpfError.value == null;
  }
}
