import 'package:base_flutter_bloc_pattem/app.dart';
import 'package:base_flutter_bloc_pattem/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Third of the size of the screen
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: const TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Message {
  static showAnyToast(String content, Toast length) {
    Fluttertoast.showToast(
      msg: content,
      toastLength: length,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black38,
      textColor: Colors.white,
      fontSize: Constant.fontSizeContentHigher16,
    );
  }

  static showToast(String? message, BuildContext context) {
    if (message != null && message.isNotEmpty) {
      if (message == 'device token expires') {
        Future.delayed(const Duration(milliseconds: 300), () {
          MyApp.restartApp(context);
        });
        Fluttertoast.showToast(
            msg: "This account is already logged in on another device",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black38,
            textColor: Colors.white,
            fontSize: Constant.fontSizeContentHigher16);
      } else {
        Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black38,
            textColor: Colors.white,
            fontSize: Constant.fontSizeContentHigher16);
      }
    }
    return const SizedBox.shrink();
  }
}
