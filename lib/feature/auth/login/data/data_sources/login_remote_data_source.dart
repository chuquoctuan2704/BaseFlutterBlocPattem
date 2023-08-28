import 'package:base_flutter_bloc_pattem/app/core/error/exceptions.dart';
import 'package:base_flutter_bloc_pattem/app/core/network/api_response.dart';
import 'package:base_flutter_bloc_pattem/app/core/network/api_service.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/data/dto/login_dto.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/domain/entities/response/login_response.dart';
import 'package:dio/dio.dart';

abstract class LoginRemoteDataSource {
  Future<ApiResponse<LoginResponse>> login(LoginDto dto);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  ApiService apiService;
  LoginRemoteDataSourceImpl({required this.apiService});

  @override
  Future<ApiResponse<LoginResponse>> login(LoginDto dto) async {
    try {
      return await apiService.login(dto.email, dto.password);
    } on DioError catch (e) {
      throw ServerException.handleError(e);
    }
  }
}
