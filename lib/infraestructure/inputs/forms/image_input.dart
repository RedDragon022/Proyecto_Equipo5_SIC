import 'package:formz/formz.dart';

// Define input validation errors
enum ImageInputError { empty }

// Extend FormzInput and provide the input type and error type.
class ImageInput extends FormzInput<String, ImageInputError> {
  // Call super.pure to represent an unmodified form input.
  const ImageInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const ImageInput.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isPure || isValid) return null;

    if (displayError == ImageInputError.empty) return 'Falta rellenar el siguiente campo';
 
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  ImageInputError? validator(String value) {
    if (value.isEmpty) return ImageInputError.empty;
    if (value.trim().isEmpty) return ImageInputError.empty;
    return null;
  }
}
