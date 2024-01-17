import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teachersguard/config/dependenciesInjection/container.dart';
import 'package:teachersguard/infraestructure/errors/errors.dart';

import 'package:teachersguard/infraestructure/inputs/inputs.dart';
import 'package:teachersguard/presentation/providers/providers.dart';
import 'package:teachersguard/useCases/use_cases.dart';

import '../../../domain/entities/entities.dart';

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  final imageProviderCallback = ref.read(cameraProvider.notifier);

  return RegisterFormNotifier(imageProviderCallback, authUseCase);
});

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  CameraNotifier imageProviderCallback;
  final AuthUseCase authUseCase;
  RegisterFormNotifier(this.imageProviderCallback, this.authUseCase)
      : super(RegisterFormState());

  void onEmailOrEmployeeNumberChange(String value) {
    final newEmailOrEmployeeNumber = EmailOrEmployeeNumber.dirty(value);

    state = state.copyWith(
        emailOrEmployeeNumber: newEmailOrEmployeeNumber,
        isValid: Formz.validate(
            [newEmailOrEmployeeNumber, state.emailOrEmployeeNumber]));
  }

  void onNameChange(String value) {
    final newName = Name.dirty(value);

    state = state.copyWith(
        name: newName, isValid: Formz.validate([newName, state.name]));
  }

  void onPasswordChange(String value) {
    final newPassword = Password.dirty(value);

    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate([newPassword, state.password]));
  }

  void onSurnamesChange(String value) {
    final newSurnames = Surnames.dirty(value);

    state = state.copyWith(
        surnames: newSurnames,
        isValid: Formz.validate([newSurnames, state.surnames]));
  }

  void onTakePhoto() async {
    await imageProviderCallback.takePhoto();

    final value = imageProviderCallback.state;

    final newImage = ImageInput.dirty(value ?? '');

    state = state.copyWith(
        image: newImage, isValid: Formz.validate([newImage, state.image]));
  }

  void onSelectPhoto() async {
    await imageProviderCallback.selectPhoto();

    final value = imageProviderCallback.state;

    final newImage = ImageInput.dirty(value ?? '');

    state = state.copyWith(
        image: newImage, isValid: Formz.validate([newImage, state.image]));
  }

  void onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    final user = User(
        id: state.emailOrEmployeeNumber.value,
        imageProfile: state.image.value,
        name: state.name.value,
        surnames: state.surnames.value);

    state = state.copyWith(isPosted: true);

    try {
      await authUseCase.register(user, state.password.value);

      state = state.copyWith(isRegistered: true);
    } on AuthException catch (e) {
      Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(
        errorMessage: e.message,
        isPosted: false);
    }
  }

  void _touchEveryField() {
    final emailOrEmployeeNumber =
        EmailOrEmployeeNumber.dirty(state.emailOrEmployeeNumber.value);
    final password = Password.dirty(state.password.value);
    final name = Name.dirty(state.name.value);
    final surnames = Surnames.dirty(state.surnames.value);
    final image = ImageInput.dirty(state.image.value);

    state = state.copyWith(
        isFormPosted: true,
        emailOrEmployeeNumber: emailOrEmployeeNumber,
        password: password,
        name: name,
        surnames: surnames,
        isValid: Formz.validate(
            [emailOrEmployeeNumber, password, name, surnames, image]));
  }
}

class RegisterFormState {
  final bool isPosted;
  final bool isRegistered;
  final bool isFormPosted;
  final bool isValid;
  final EmailOrEmployeeNumber emailOrEmployeeNumber;
  final Password password;
  final Name name;
  final Surnames surnames;
  final ImageInput image;
  final String errorMessage;

  RegisterFormState(
      {this.isPosted = false,
      this.isRegistered = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.emailOrEmployeeNumber = const EmailOrEmployeeNumber.pure(),
      this.password = const Password.pure(),
      this.name = const Name.pure(),
      this.surnames = const Surnames.pure(),
      this.image = const ImageInput.pure(),
      this.errorMessage = ''
      });

  RegisterFormState copyWith({
    bool? isPosted,
    bool? isFormPosted,
    bool? isRegistered,
    bool? isValid,
    EmailOrEmployeeNumber? emailOrEmployeeNumber,
    Password? password,
    Name? name,
    Surnames? surnames,
    ImageInput? image,
    String? errorMessage,
  }) =>
      RegisterFormState(
          isPosted: isPosted ?? this.isPosted,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isRegistered: isRegistered ?? this.isRegistered,
          isValid: isValid ?? this.isValid,
          emailOrEmployeeNumber:
              emailOrEmployeeNumber ?? this.emailOrEmployeeNumber,
          password: password ?? this.password,
          name: name ?? this.name,
          surnames: surnames ?? this.surnames,
          image: image ?? this.image,
          errorMessage: errorMessage ?? this.errorMessage
          );

  @override
  String toString() {
    return '''
      isFormPosted: $isFormPosted,
      isValid: $isValid,
      emailOrEmployeeNumber: $emailOrEmployeeNumber,
      password: $password,
      name: $name,
      surnames: $surnames,
      image: $image,
    ''';
  }
}
