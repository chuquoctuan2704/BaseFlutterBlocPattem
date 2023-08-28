part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginAction extends LoginEvent {
  const LoginAction() : super();
  @override
  List<Object> get props => [];
}

class ValidateEmail extends LoginEvent {
  final String? email;

  const ValidateEmail({this.email}) : super();
  @override
  List<Object> get props => [];
}

class ValidatePassword extends LoginEvent {
  final String? password;

  const ValidatePassword({this.password}) : super();
  @override
  List<Object> get props => [];
}
