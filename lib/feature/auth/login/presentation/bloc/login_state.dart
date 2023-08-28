part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool loading;
  final String email;
  final String password;
  final String message;
  final bool validateEmail;
  final bool validatePassword;
  final String errorEmail;
  final String errorPassword;
  final bool loginSuccess;

  const LoginState._({
    this.loading = false,
    this.email = '',
    this.password = '',
    this.message = '',
    this.validateEmail = false,
    this.validatePassword = false,
    this.errorEmail = '',
    this.errorPassword = '',
    this.loginSuccess = false,
  });

  const LoginState.initial() : this._();

  LoginState copyWith({
    bool? loading,
    String? message,
    String? email,
    String? password,
    bool? validateEmail,
    bool? validatePassword,
    String? errorEmail,
    String? errorPassword,
    bool? loginSuccess,
  }) {
    return LoginState._(
        loading: loading ?? this.loading,
        email: email ?? this.email,
        password: password ?? this.password,
        message: message ?? '',
        validateEmail: validateEmail ?? this.validateEmail,
        validatePassword: validatePassword ?? this.validatePassword,
        errorEmail: errorEmail ?? this.errorEmail,
        errorPassword: errorPassword ?? this.errorPassword,
        loginSuccess: loginSuccess ?? this.loginSuccess);
  }

  @override
  List<Object?> get props => [
        loading,
        email,
        password,
        validateEmail,
        validatePassword,
        message,
        errorEmail,
        errorPassword,
        loginSuccess
      ];
}
