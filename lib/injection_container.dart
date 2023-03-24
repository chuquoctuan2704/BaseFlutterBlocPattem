import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  //Service
  getIt.registerFactory(() => Dio());
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
}
