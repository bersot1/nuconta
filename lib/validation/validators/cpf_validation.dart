import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:equatable/equatable.dart';

import '../../validation/protocols/protocols.dart';

class CPFValidation extends Equatable implements IFieldValidation {
  final String field;

  List get props => [field];

  CPFValidation(this.field);

  String? validate(String? value) {
    return CPFValidator.isValid(value) ? null : "CPF inválido";
  }
}
