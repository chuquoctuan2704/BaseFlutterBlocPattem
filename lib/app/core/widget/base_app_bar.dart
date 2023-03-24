import 'package:base_flutter_bloc_pattem/app/app_constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  Color textColor;
  String? leftIcon;
  String? rightIcon;
  VoidCallback? leftAction;
  VoidCallback? rightAction;
  double height;
  Color? colorBackground;
  double? elevation;
  bool automaticallyImplyLeading;

  BaseAppBar(
      {Key? key,
      required this.title,
      this.textColor = Colors.black,
      this.leftIcon,
      this.leftAction,
      this.rightIcon,
      this.rightAction,
      this.height = Constant.appbarHeight,
      this.colorBackground = Colors.white,
      this.elevation,
      this.automaticallyImplyLeading = false})
      : preferredSize = Size.fromHeight(height),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorBackground,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: (leftIcon != null && leftAction != null)
          ? (leftIcon == Constant.defaultElement)
              ? IconButton(
                  onPressed: leftAction,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ))
              : Container(
                  height: height,
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  alignment: Alignment.center,
                  child: IconButton(
                    splashRadius: 28,
                    icon: Image(
                      image: AssetImage(leftIcon!),
                      width: 30,
                    ),
                    onPressed: leftAction,
                  ),
                )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
      actions: [
        (rightIcon != null && rightAction != null)
            ? Container(
                padding: const EdgeInsets.only(
                  right: 20,
                  top: 8,
                  bottom: 8,
                ),
                child: IconButton(
                  splashRadius: 28,
                  icon: Image(
                    image: AssetImage(rightIcon!),
                    width: 30,
                  ),
                  onPressed: rightAction,
                ))
            : const SizedBox.shrink(),
      ],
      centerTitle: true,
      elevation: elevation ?? 2,
    );
  }

  @override
  Size preferredSize;
}
