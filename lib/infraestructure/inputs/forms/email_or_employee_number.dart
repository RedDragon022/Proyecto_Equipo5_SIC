import 'package:formz/formz.dart';

// Define input validation errors
enum EmailOrEmployeeNumberError { empty, length }

// Extend FormzInput and provide the input type and error type.
class EmailOrEmployeeNumber extends FormzInput<String, EmailOrEmployeeNumberError> {
  // Call super.pure to represent an unmodified form input.
  const EmailOrEmployeeNumber.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailOrEmployeeNumber.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isPure || isValid) return null;

    if (displayError == EmailOrEmployeeNumberError.empty) return 'Falta rellenar el siguiente campo';
    if (displayError == EmailOrEmployeeNumberError.length) {
      return 'El email o numero de empleado es demasiado largo';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailOrEmployeeNumberError? validator(String value) {
    if (value.isEmpty) return EmailOrEmployeeNumberError.empty;
    if (value.trim().isEmpty) return EmailOrEmployeeNumberError.empty;
    if (value.length  > 200) return EmailOrEmployeeNumberError.length;
    return null;
  }
}
