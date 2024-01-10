import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teachersguard/infraestructure/errors/auth/auth_error.dart';
import 'package:teachersguard/infraestructure/inputs/inputs.dart';
import 'package:teachersguard/presentation/providers/providers.dart';

final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginCallback = ref.read(userProvider.notifier).login;

  return LoginFormNotifier(loginCallback);
});

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  Future<void> Function(String, String) loginCallback;
  LoginFormNotifier(this.loginCallback) : super(LoginFormState());

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

  void onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);

    try {
      await loginCallback(
          state.emailOrEmployeeNumber.value, state.password.value);

      state = state.copyWith(isAuthenticated: true);

    } on AuthException catch (e) {
      state = state.copyWith(errorMessage: e.message);
      Future.delayed(const Duration(seconds: 2));

      state = state.copyWith(isPosting: false);
    }
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
  final String errorMessage;
  final bool isAuthenticated;

  LoginFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.emailOrEmployeeNumber = const EmailOrEmployeeNumber.pure(),
      this.password = const Password.pure(),
      this.errorMessage = '',
      this.isAuthenticated = false});

  LoginFormState copyWith(
          {bool? isPosting,
          bool? isFormPosted,
          bool? isValid,
          EmailOrEmployeeNumber? emailOrEmployeeNumber,
          Password? password,
          String? errorMessage,
          bool? isAuthenticated}) =>
      LoginFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          emailOrEmployeeNumber:
              emailOrEmployeeNumber ?? this.emailOrEmployeeNumber,
          password: password ?? this.password,
          errorMessage: errorMessage ?? this.errorMessage,
          isAuthenticated: isAuthenticated ?? this.isAuthenticated);
}
