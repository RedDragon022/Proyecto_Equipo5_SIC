import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isPure || isValid) return null;

    if (displayError == PasswordError.empty) return 'Falta rellenar el siguiente campo';
    if (displayError == PasswordError.length) {
      return 'La contraseña debe ser de 6 a 10 caracters';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) return PasswordError.empty;
    if (value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6 || value.length > 10) return PasswordError.length;
    return null;
  }
}
