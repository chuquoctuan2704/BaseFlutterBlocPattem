import 'package:base_flutter_bloc_pattem/app/core/helper/localizations/localization_service.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/presentation/bloc/login_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'routing.dart';
import 'injection_container.dart' as di;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static restartApp(BuildContext context) async {
    // SharedPreferenceHelper sharedPreferenceHelper = di.getIt();
    await di.getIt.reset();
    await di.init();
    // sharedPreferenceHelper.setIsFist(true);
    // sharedPreferenceHelper.setAuthToken('');
    context.findAncestorStateOfType<_MyAppState>()?.restartApp();
  }

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
  }

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  ThemeData _buildTheme() {
    var baseTheme = ThemeData.light();

    return baseTheme.copyWith(
        // textTheme: GoogleFonts.mulishTextTheme(baseTheme.textTheme),
        );
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.getIt<LoginBloc>()),

          /// Add new event when open screen
          // BlocProvider(
          //     create: (context) => di.getIt<LessonListBloc>()
          //       ..add(const LoadLessonFeatured())
          //       ..add(const LoadLessonNewest())
          //       ..add(const LoadLessonTrending())),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: _buildTheme(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: LocalizationService.supportedLocales,
              locale: LocalizationService.locale,
              onGenerateRoute: Routing.generateRoute,
              initialRoute: Routing.splash,
            );
          },
        ),
      ),
    );
  }
}
