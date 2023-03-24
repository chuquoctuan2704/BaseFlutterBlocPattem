
import 'package:base_flutter_bloc_pattem/app.dart';
import 'package:base_flutter_bloc_pattem/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceUtils {
  static late BuildContext _context;

  static setContext(BuildContext context){
    _context = context;
  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static double getScaledSize(BuildContext context, double scale) =>
      scale *
          (MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.height);

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScaledWidth(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.width;

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getScaledHeight(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.height;

  static double getStatusBarHeight(BuildContext context) {
    return Get.statusBarHeight;
  }

  static String getURLImage(String imageName){
    List<String> list = imageName.split('-');
    String endImage = list[list.length -1] + '.jpeg';
    String url = Constant.imageURL + Uri.encodeComponent(imageName) + '-' + endImage;
    return url;
  }

  static void restartApp(){
    MyApp.restartApp(_context);
  }
}
