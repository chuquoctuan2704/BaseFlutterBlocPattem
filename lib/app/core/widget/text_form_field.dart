import 'package:base_flutter_bloc_pattem/app/app_constants.dart';
import 'package:flutter/material.dart';

// import '../constants/constants.dart';

class FilledTextFormField extends StatelessWidget {
  final double? width;
  final double height;
  final String? placeholder;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextEditingController? controller;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? errorText;
  final TextStyle? errorStyle;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Color? borderColor;
  final VoidCallback? onDone;

  const FilledTextFormField(
      {Key? key,
      this.focusNode,
      this.width,
      this.height = 48,
      this.placeholder,
      this.textStyle = const TextStyle(color: Colors.black87),
      this.obscureText = false,
      this.hintTextStyle = const TextStyle(color: Constant.colorTextHint),
      this.onChanged,
      this.validator,
      this.controller,
      this.autofocus = false,
      this.textInputAction,
      this.suffixIcon,
      this.errorText,
      this.errorStyle,
      this.keyboardType,
      this.prefixIcon,
      this.fillColor,
      this.borderColor,
      this.onDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: errorText == null ? height : (height + 24),
      child: TextFormField(
        keyboardType: keyboardType,
        focusNode: focusNode,
        style: textStyle,
        controller: controller,
        autofocus: autofocus,
        textInputAction: textInputAction,
        onChanged: onChanged,
        cursorColor: Colors.black87,
        decoration: InputDecoration(
          fillColor: fillColor,
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.only(left: height / 2),
          filled: true,
          // fillColor: kFilledTextField,
          border: errorText == null
              ? OutlineInputBorder(
                  borderSide: borderColor == null
                      ? BorderSide.none
                      : BorderSide(color: borderColor!),
                  borderRadius: BorderRadius.circular(5),
                )
              : OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFFE6E6E6), width: 1.0),
                  borderRadius: BorderRadius.circular(5),
                ),

          hintText: placeholder,
          hintStyle: hintTextStyle,
          suffixIcon: suffixIcon,
          errorText: errorText,
          errorStyle: errorStyle ?? TextStyle(fontSize: Constant.fontSizeError),
          errorMaxLines: 2,
        ),
        validator: validator,
        obscureText: obscureText,
        onEditingComplete: onDone,
      ),
    );
  }
}
