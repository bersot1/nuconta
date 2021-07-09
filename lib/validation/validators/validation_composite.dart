import '../../../validation/protocols/field_validation.dart';
import '../../../validation/protocols/validation.dart';

class ValidationComposite implements IValidation {
  final List<IFieldValidation> validations;

  ValidationComposite(this.validations);

  String? validate({required String field, required String value}) {
    late String? error;
    for (var validation in validations) {
      error = validation.validate(value);
      if (error?.isNotEmpty == true) {
        return error;
      }
    }
    return error;
  }
}
