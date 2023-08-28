import 'package:base_flutter_bloc_pattem/app/core/error/failure.dart';
import 'package:base_flutter_bloc_pattem/app/core/network/api_response.dart';
import 'package:base_flutter_bloc_pattem/app/core/usecases/usecase.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/data/dto/login_dto.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/domain/entities/response/login_response.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';


class LoginUsecase implements UseCase<ApiResponse<LoginResponse>, LoginDto> {
  final LoginRepository repository;

  LoginUsecase({required this.repository});

  @override
  Future<Either<Failure, ApiResponse<LoginResponse>>> call(LoginDto dto) async {
    return await repository.login(dto);
  }
}
