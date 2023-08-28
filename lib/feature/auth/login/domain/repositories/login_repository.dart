
import 'package:base_flutter_bloc_pattem/app/core/error/failure.dart';
import 'package:base_flutter_bloc_pattem/app/core/network/api_response.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/data/dto/login_dto.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/domain/entities/response/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository{
  Future<Either<Failure, ApiResponse<LoginResponse>>> login(LoginDto params);
}