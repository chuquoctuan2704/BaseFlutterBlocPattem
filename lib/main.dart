import 'package:base_flutter_bloc_pattem/app/app_constants.dart';
import 'package:base_flutter_bloc_pattem/app/core/helper/localizations/localization_service.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'bloc_observer.dart';
import 'injection_container.dart' as di;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setPreferredOrientations();
  // Initialize the injection container
  await di.init();
  // follow Bloc event
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationService.supportedLocales,
      path: Constant.pathTranslations,
      fallbackLocale: LocalizationService.fallbackLocale,
      startLocale: LocalizationService.locale,
      child: const MyApp(),
    ),
  );
}

void setPreferredOrientations() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
}
