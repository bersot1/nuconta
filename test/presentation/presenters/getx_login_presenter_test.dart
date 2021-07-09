import 'package:nuconta/domain/domain.dart';
import 'package:nuconta/presentation/presenters/getx_login_presenter.dart';
import 'package:nuconta/validation/validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ValidationSpy extends Mock implements IValidation {}

class SaveCurrentCpfSpy extends Mock implements ISaveCurrentCpf {}

main() {
  late ValidationSpy validationSpy;
  late SaveCurrentCpfSpy saveCurrentCpfSpy;
  late GetxLoginPresenter sut;
  late String validCpf;
  late String invalidCpf;

  When mockValidationCall(String? field) => when(() => validationSpy.validate(
      field: field == null ? any(named: 'field') : field,
      value: any(named: 'value')));

  void mockValidation({String? field, String? value}) =>
      mockValidationCall(field).thenReturn(value);

  setUp(() {
    validationSpy = ValidationSpy();
    saveCurrentCpfSpy = SaveCurrentCpfSpy();
    sut = GetxLoginPresenter(
        validation: validationSpy, saveCurrentCpf: saveCurrentCpfSpy);
    validCpf = '153.078.227-90';
    invalidCpf = '111.111.111-11';
  });

  test('Should call Validation with correct CPF', () async {
    sut.validateCPF(validCpf);

    verify(() => validationSpy.validate(field: 'cpf', value: validCpf))
        .called(1);
  });

  test('Should emit cpfError if validation fails', () async {
    mockValidation(value: 'error');
    sut.cpfErrorStream?.listen(expectAsync1((error) => expect(error, 'error')));

    sut.isFormValidStream
        ?.listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateCPF(invalidCpf);
    sut.validateCPF(invalidCpf);
  });

  test('Should emit null if validation succeeds', () async {
    sut.cpfErrorStream?.listen(expectAsync1((error) => expect(error, null)));

    sut.isFormValidStream
        ?.listen(expectAsync1((isValid) => expect(isValid, true)));

    sut.validateCPF(invalidCpf);
    sut.validateCPF(invalidCpf);
  });

  test('Should call auth with correct cpf', () async {
    sut.validateCPF(validCpf);

    await sut.auth();

    verify(() => saveCurrentCpfSpy.saveSecure(validCpf));
  });

  test('Should emits corrects events on auth success', () async {
    sut.validateCPF(validCpf);

    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));

    await sut.auth();
  });
}
