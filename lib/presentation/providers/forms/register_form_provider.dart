import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import 'package:teachersguard/infraestructure/inputs/inputs.dart';
import 'package:teachersguard/presentation/providers/providers.dart';

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  final imageState = ref.watch(cameraProvider);
  return RegisterFormNotifier(imageState);
});

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final String? imageState;
  RegisterFormNotifier(this.imageState) : super(RegisterFormState());

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

  void onFormSubmit() {
    _touchEveryField();
    
    if (!state.isValid) return;
    
    print(state.toString());
  }

  void _touchEveryField() {
    final emailOrEmployeeNumber =
        EmailOrEmployeeNumber.dirty(state.emailOrEmployeeNumber.value);
    final password = Password.dirty(state.password.value);
    final name = Name.dirty(state.name.value);
    final surnames = Surnames.dirty(state.surnames.value);

    state = state.copyWith(
        isFormPosted: true,
        emailOrEmployeeNumber: emailOrEmployeeNumber,
        password: password,
        name: name,
        surnames: surnames,
        isValid:
            Formz.validate([emailOrEmployeeNumber, password, name, surnames]));
  }
}

class RegisterFormState {
  final bool isFormPosted;
  final bool isValid;
  final EmailOrEmployeeNumber emailOrEmployeeNumber;
  final Password password;
  final Name name;
  final Surnames surnames;

  RegisterFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.emailOrEmployeeNumber = const EmailOrEmployeeNumber.pure(),
    this.password = const Password.pure(),
    this.name = const Name.pure(),
    this.surnames = const Surnames.pure(),
  });

  RegisterFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    EmailOrEmployeeNumber? emailOrEmployeeNumber,
    Password? password,
    Name? name,
    Surnames? surnames,
    String? image,
  }) =>
      RegisterFormState(
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        emailOrEmployeeNumber:
            emailOrEmployeeNumber ?? this.emailOrEmployeeNumber,
        password: password ?? this.password,
        name: name ?? this.name,
        surnames: surnames ?? this.surnames,
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
    ''';
  }
}
