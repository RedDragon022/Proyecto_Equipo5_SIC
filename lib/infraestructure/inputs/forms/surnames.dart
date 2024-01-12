import 'package:formz/formz.dart';

// Define input validation errors
enum SurnamesError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Surnames extends FormzInput<String, SurnamesError> {
  // Call super.pure to represent an unmodified form input.
  const Surnames.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Surnames.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isPure || isValid) return null;

    if (displayError == SurnamesError.empty) return 'Falta rellenar el siguiente campo';
    if (displayError == SurnamesError.length) {
      return 'Los apellidos exceden a los 255 caracteres';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  SurnamesError? validator(String value) {
    if (value.isEmpty) return SurnamesError.empty;
    if (value.trim().isEmpty) return SurnamesError.empty;
    if (value.length > 255) return SurnamesError.length;
    return null;
  }
}
