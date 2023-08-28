import 'package:base_flutter_bloc_pattem/app/app_constants.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/data/dto/login_dto.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/domain/usecases/login_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUsecase;

  LoginBloc({required LoginUsecase loginUsecase})
      : _loginUsecase = loginUsecase,
        super(const LoginState.initial()) {
    on<LoginAction>(_onLoginAction, transformer: sequential());
    on<ValidateEmail>(_onValidateEmail, transformer: sequential());
    on<ValidatePassword>(_onValidatePassword, transformer: sequential());
  }

  void _onLoginAction(LoginAction event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loading: true));
    final result = await _loginUsecase
        .call(LoginDto(email: state.email, password: state.password));
    result.fold((l) => emit(state.copyWith(message: l.message, loading: false)),
        (r) => emit(state.copyWith(loginSuccess: true, loading: false)));
  }

  void _onValidateEmail(ValidateEmail event, Emitter<LoginState> emit) async {
    String error = '';
    bool validatedEmail = false;
    if (!Constant.regEmail.hasMatch(event.email!)) {
      error = 'Email invalid';
    } else {
      validatedEmail = true;
    }
    emit(
      state.copyWith(
        email: event.email,
        errorEmail: error,
        validateEmail: validatedEmail,
      ),
    );
  }

  void _onValidatePassword(
      ValidatePassword event, Emitter<LoginState> emit) async {
    String error = '';
    bool validatedEmail = false;
    if (event.password!.length < 6) {
      error = 'Password length is too short';
    } else if (!Constant.regPassword.hasMatch(event.password!)) {
      error = 'Password must not contain special characters';
    } else {
      validatedEmail = true;
    }
    emit(
      state.copyWith(
        password: event.password,
        errorPassword: error,
        validatePassword: validatedEmail,
      ),
    );
  }
}
