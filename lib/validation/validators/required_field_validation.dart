import 'package:equatable/equatable.dart';
import '../../../validation/validation.dart';

class RequiredFieldValidation extends Equatable implements IFieldValidation {
  @override
  final String field;

  const RequiredFieldValidation(this.field);

  @override
  List get props => [field];

  @override
  String? validate(String? value) {
    return value?.isNotEmpty == true ? null : 'Campo obrigatório';
  }
}
