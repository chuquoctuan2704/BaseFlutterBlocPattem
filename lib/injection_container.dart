import 'package:base_flutter_bloc_pattem/app/core/network/api_service.dart';
import 'package:base_flutter_bloc_pattem/app/core/utils/shared_preference_helper.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/data/repositories/login_repository_impl.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/domain/repositories/login_repository.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/domain/usecases/login_usecases.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/presentation/bloc/login_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  //Service
  getIt.registerFactory(() => Dio());
  getIt.registerFactory(() => ApiService(getIt()));
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));

  //bloc
  getIt.registerFactory(() => LoginBloc(loginUsecase: getIt()));

  // data sources
  getIt.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(apiService: getIt()));

  //repositories
  getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemoteDataSource: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => LoginUsecase(repository: getIt()));
}
