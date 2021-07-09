import 'package:nuconta/validation/validation.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late CPFValidation sut;

  setUp(() {
    sut = CPFValidation('any_field');
  });

  test('Should return error if cpf is null', () {
    expect(sut.validate(null), 'CPF inválido');
  });

  test('Should return error if cpf is invalid', () {
    expect(sut.validate('111.111.111-11'), 'CPF inválido');
  });

  test('Should return null if cpf is valid', () {
    expect(sut.validate('153.078.227-90'), null);
  });
}
