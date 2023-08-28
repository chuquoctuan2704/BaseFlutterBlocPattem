import 'package:base_flutter_bloc_pattem/app/core/network/api_response.dart';
import 'package:base_flutter_bloc_pattem/app/core/utils/shared_preference_helper.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/domain/entities/response/login_response.dart';
import 'package:base_flutter_bloc_pattem/injection_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

class API {
  static SharedPreferenceHelper sharedPreferenceHelper =
      SharedPreferenceHelper(getIt());
  static const String baseUrl = "https://dev-api.io"; // test
  static const int connectTimeOut = 30000;
  static const int sendTimeOut = 30000;
  static const int receiveTimeOut = 30000;

  static const String login = "/auth/login";
  static const String lesson = "/discovery/lessons";
  static const String myLearning = "/lessons/my-lessons/library";
  static const String getListPetStore = "/marketplace/list-pet-store";
  static const String getListFoodStore = "/marketplace/list-food-store";
  static const String getListOtherItemStore = "/marketplace/list-other-store";
}

@RestApi(baseUrl: API.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
        receiveTimeout: const Duration(milliseconds: API.receiveTimeOut) ,
        connectTimeout: const Duration(milliseconds: API.connectTimeOut),
        sendTimeout: const Duration(milliseconds: API.sendTimeOut),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${API.sharedPreferenceHelper.getAuthToken}',
        });

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        request: false,
        requestBody: true,
      ));
    }
    return _ApiService(dio, baseUrl: baseUrl);
  }

  /// Login
  @POST(API.login)
  @FormUrlEncoded()
  Future<ApiResponse<LoginResponse>> login(
    @Field("email") String email,
    @Field("password") String password,
  );

}
