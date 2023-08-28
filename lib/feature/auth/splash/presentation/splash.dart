import 'package:base_flutter_bloc_pattem/app/core/utils/shared_preference_helper.dart';
import 'package:base_flutter_bloc_pattem/injection_container.dart';
import 'package:base_flutter_bloc_pattem/routing.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SharedPreferenceHelper sharedPreferenceHelper =
      SharedPreferenceHelper(getIt());

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (sharedPreferenceHelper.getAuthToken != '') {
          // Navigator.of(context).pushReplacementNamed(Routing.home);
        } else {
          Navigator.of(context).pushReplacementNamed(Routing.login);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: Icon(
            Icons.account_balance,
            size: MediaQuery.of(context).size.width / 2,
          ),
        ),
      ),
    );
  }
}
