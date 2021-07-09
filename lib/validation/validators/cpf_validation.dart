import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:equatable/equatable.dart';

import '../../validation/protocols/protocols.dart';

class CPFValidation extends Equatable implements IFieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const CPFValidation(this.field);

  @override
  String? validate(String? value) {
    return CPFValidator.isValid(value) ? null : "CPF inválido";
  }
}
