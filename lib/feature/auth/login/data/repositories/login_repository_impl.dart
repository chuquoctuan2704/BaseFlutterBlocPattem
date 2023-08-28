import 'package:base_flutter_bloc_pattem/app/core/error/exceptions.dart';
import 'package:base_flutter_bloc_pattem/app/core/error/failure.dart';
import 'package:base_flutter_bloc_pattem/app/core/network/api_response.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/data/dto/login_dto.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/domain/entities/response/login_response.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, ApiResponse<LoginResponse>>> login(
      LoginDto dto) async {
    try {
      final loginModel = await loginRemoteDataSource.login(dto);
      return Right(loginModel);
    } on ServerException catch (error) {
      return Left(ServerFailure.from(error));
    }
  }
}
