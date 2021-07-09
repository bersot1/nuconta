import 'package:equatable/equatable.dart';
import '../../../validation/validation.dart';

class RequiredFieldValidation extends Equatable implements IFieldValidation {
  final String field;

  RequiredFieldValidation(this.field);

  List get props => [field];

  @override
  String? validate(String? value) {
    return value?.isNotEmpty == true ? null : 'Campo obrigatório';
  }
}
