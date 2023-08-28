import 'package:flutter/material.dart';

class Constant {
  // path
  static String pathTranslations = 'assets/translations';

  //Regex
  static RegExp regEmail = RegExp(
      r'^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$');
  static RegExp regPassword = RegExp(r"^([a-zA-Z0-9@]{6,})$");

  //URL
  static String imageURL =
      'https://lessonbox-dev-image.s3.ap-southeast-1.amazonaws.com/';
  static String imageURLEnd = '-500.jpeg';

  //Color
  static const Color colorTextHint = Color(0xff7A7A7A);
  static const Color colorButtonBlue = Color(0xff0B6FFE);
  static const Color colorBorder = Color(0xffEEEEEE);
  static const Color colorBorderD8D8D8 = Color(0xffD8D8D8);
  static const Color colorBorder707070 = Color(0xff707070);
  static const Color colorBorder979797 = Color(0xff979797);
  static const Color colorRatingFill = Color(0xff212121);
  static const Color colorGreenText = Color(0xff2EC855);

  //Number
  static const double appbarHeight = 60;

  // Image
  // static String iconSearch = 'assets/images/icon_search.png';
  // static String iconEmail = 'assets/images/icon_email.png';

  // svg
  // static String icExplore = 'assets/svg/ic_explore.svg';
  // static String icMyLearning = 'assets/svg/ic_my_learning.svg';

  //String
  static String defaultElement = 'default';

  //Font size
  static double fontSizeTitle = 24;
  static double fontSizeTitleSection = 20;
  static double fontSizeContentHigher18 = 18;
  static double fontSizeContentHigher16 = 16;
  static double fontSizeContent = 14;
  static double fontSizeContentLower = 12;
  static double fontSizeContentLower11 = 11;
  static double fontSizeError = 10;
  static double fontSizeMini = 6;
  static int energyMax = 100;
}
