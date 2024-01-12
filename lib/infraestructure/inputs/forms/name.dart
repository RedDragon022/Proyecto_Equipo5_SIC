import 'package:formz/formz.dart';

// Define input validation errors
enum NameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Name extends FormzInput<String, NameError> {
  // Call super.pure to represent an unmodified form input.
  const Name.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Name.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isPure || isValid) return null;

    if (displayError == NameError.empty) return 'Falta rellenar el siguiente campo';
    if (displayError == NameError.length) {
      return 'El nombre excede de los 100 caracteres';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NameError? validator(String value) {
    if (value.isEmpty) return NameError.empty;
    if (value.trim().isEmpty) return NameError.empty;
    if (value.length > 100) return NameError.length;
    return null;
  }
}
