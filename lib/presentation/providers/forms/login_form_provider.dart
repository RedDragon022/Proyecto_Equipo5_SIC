import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teachersguard/infraestructure/inputs/inputs.dart';

final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  return LoginFormNotifier();
});

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(LoginFormState());

  void onEmailOrEmployeeNumberChange(String value) {
    final newEmailOrEmployeeNumber = EmailOrEmployeeNumber.dirty(value);

    state = state.copyWith(
        emailOrEmployeeNumber: newEmailOrEmployeeNumber,
        isValid: Formz.validate(
            [newEmailOrEmployeeNumber, state.emailOrEmployeeNumber]));
  }

  void onPasswordChange(String value) {
    final newPassword = Password.dirty(value);

    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate([newPassword, state.password]));
  }

  void onFormSubmit() {
    _touchEveryField();

    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
  }

  void _touchEveryField() {
    final emailOrEmployeeNumber =
        EmailOrEmployeeNumber.dirty(state.emailOrEmployeeNumber.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
        isFormPosted: true,
        emailOrEmployeeNumber: emailOrEmployeeNumber,
        password: password,
        isValid: Formz.validate([emailOrEmployeeNumber, password]));
  }

}

class LoginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final EmailOrEmployeeNumber emailOrEmployeeNumber;
  final Password password;

  LoginFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.emailOrEmployeeNumber = const EmailOrEmployeeNumber.pure(),
      this.password = const Password.pure()});

  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    EmailOrEmployeeNumber? emailOrEmployeeNumber,
    Password? password,
  }) =>
      LoginFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        emailOrEmployeeNumber:
            emailOrEmployeeNumber ?? this.emailOrEmployeeNumber,
        password: password ?? this.password,
      );
}
