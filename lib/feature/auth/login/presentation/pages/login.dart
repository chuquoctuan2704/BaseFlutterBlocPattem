import 'package:base_flutter_bloc_pattem/app/app_constants.dart';
import 'package:base_flutter_bloc_pattem/app/core/utils/device_utils.dart';
import 'package:base_flutter_bloc_pattem/app/core/utils/shared_preference_helper.dart';
import 'package:base_flutter_bloc_pattem/app/core/widget/base_widget.dart';
import 'package:base_flutter_bloc_pattem/app/core/widget/button_app.dart';
import 'package:base_flutter_bloc_pattem/app/core/widget/text_form_field.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/login/presentation/bloc/login_bloc.dart';
import 'package:base_flutter_bloc_pattem/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  String? inputPass, inputEmail;
  bool isShow = false;
  bool isTextFieldError = false;
  SharedPreferenceHelper sharedPreferenceHelper =
      SharedPreferenceHelper(getIt());

  @override
  void initState() {
    if (sharedPreferenceHelper.getEmail != '' &&
        sharedPreferenceHelper.getPassword != '') {
      emailTextController =
          TextEditingController(text: sharedPreferenceHelper.getEmail);
      onChangeValidateEmail();
      passwordTextController =
          TextEditingController(text: sharedPreferenceHelper.getPassword);
      onChangeValidatePassword();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state.loginSuccess) {
            // if (sharedPreferenceHelper.getIsFist) {
            //   Navigator.of(context).pushReplacementNamed(Routing.welcome1);
            // } else {
            //   Navigator.of(context).pushNamed(Routing.home);
            // }
          }
        });
        return BaseWidget(
          bodyWidget: buildBody(context, state),
          loading: state.loading,
          errorMessage: state.message,
        );
      },
    );
  }

  buildBody(BuildContext context, LoginState state) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 25.h,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'login.Sign in'.tr(),
                      style: TextStyle(fontSize: Constant.fontSizeTitle),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('login.New user?'.tr()),
                        TextButton(
                            child: Text('login.Create an account'.tr()),
                            onPressed: () {
                              // Navigator.of(context).pushNamed(Routing.register);
                            }),
                      ],
                    )
                  ],
                )),
              ),
              _textFormFieldUserName(context, state),
              _textFormFieldPassword(context, state),
              const SizedBox(height: 16),
              SizedBox(
                width: DeviceUtils.getWidth(context),
                child: ButtonApp(
                  child: Text(
                    'login.Sign in'.tr().toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (state.validateEmail && state.validatePassword) {
                      actionLogin();
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                  child: Text('login.Forgot password?'.tr()), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  _textFormFieldUserName(BuildContext context, LoginState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: FilledTextFormField(
        prefixIcon: const Icon(Icons.email),
        controller: emailTextController,
        placeholder: "login.email".tr(),
        autofocus: false,
        textInputAction: TextInputAction.done,
        onChanged: (value) => onChangeValidateEmail(),
        errorText: (state.errorEmail != "") ? state.errorEmail : null,
      ),
    );
  }

  _textFormFieldPassword(BuildContext context, LoginState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: FilledTextFormField(
        controller: passwordTextController,
        prefixIcon: const Icon(Icons.password),
        obscureText: !isShow,
        placeholder: "login.password".tr(),
        autofocus: false,
        textInputAction: TextInputAction.done,
        onChanged: (value) => onChangeValidatePassword(),
        errorText: (state.errorPassword != '') ? state.errorPassword : null,
      ),
    );
  }

  void actionLogin() {
    BlocProvider.of<LoginBloc>(context).add(const LoginAction());
  }

  void onChangeValidateEmail() {
    BlocProvider.of<LoginBloc>(context)
        .add(ValidateEmail(email: emailTextController.text));
  }

  void onChangeValidatePassword() {
    BlocProvider.of<LoginBloc>(context)
        .add(ValidatePassword(password: passwordTextController.text));
  }
}
