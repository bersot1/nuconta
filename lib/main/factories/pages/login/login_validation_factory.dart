import '../../../../validation/validation.dart';

import '../../../../validation/validators/required_field_validation.dart';

IValidation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<IFieldValidation> makeLoginValidations() {
  return [CPFValidation('cpf'), RequiredFieldValidation('cpf')];
}
