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
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  Locale _locale = const Locale('en', 'US');
  List<Locale> locales = [const Locale('en', 'US'), const Locale('ja', 'JP')];

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
    context.setLocale(value);
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
    setLocale(_locale);
    return KeyedSubtree(
      key: key,
      child: MultiBlocProvider(
          providers:[
          ],
          child: Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "",
              theme: _buildTheme(),
              //   primaryColor: Colors.green.shade800,
              //   accentColor: Colors.green.shade600,
              // ),
              localizationsDelegates: context.localizationDelegates,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale?.languageCode &&
                      supportedLocale.countryCode == locale?.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              supportedLocales: locales,
              locale: _locale,
              onGenerateRoute: Routing.generateRoute,
              initialRoute: Routing.splash,
            );
          })),
    );
  }
}
