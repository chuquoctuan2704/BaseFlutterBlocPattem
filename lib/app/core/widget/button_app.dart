import 'package:base_flutter_bloc_pattem/app/app_constants.dart';
import 'package:flutter/material.dart';

class ButtonApp extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color colorButton;
  final Color colorBorder;
  const ButtonApp(
      {Key? key,
      required this.child,
      this.onPressed,
      this.colorButton = Constant.colorButtonBlue,
      this.colorBorder = Colors.white})
      : super(key: key);

  @override
  State<ButtonApp> createState() => _ButtonAppState();
}

class _ButtonAppState extends State<ButtonApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100.w,
      height: 40,
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: widget.colorButton,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: widget.colorBorder)),
      child: MaterialButton(
        onPressed: widget.onPressed ?? () {},
        child: widget.child,
      ),
    );
  }
}
