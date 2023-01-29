import 'package:flutter/material.dart';

import '../constants/export.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.label,
    this.backgroundColor,
    this.buttonTextStyle,
    this.height,
    required this.onPressed,
    this.elevation,
    this.maxLines,
    this.width,
  }) : super(key: key);

  const MyButton.primary({
    Key? key,
    this.label,
    this.backgroundColor = AppColor.primary,
    this.buttonTextStyle,
    this.height,
    required this.onPressed,
    this.elevation,
    this.maxLines,
    this.width,
  }) : super(key: key);

  const MyButton.secondary({
    Key? key,
    this.label,
    this.backgroundColor,
    this.buttonTextStyle,
    this.height,
    required this.onPressed,
    this.elevation,
    this.maxLines,
    this.width,
  }) : super(key: key);

  final Widget? label;
  final Color? backgroundColor;
  final TextStyle? buttonTextStyle;
  final double? height;
  final double? width;
  final int? maxLines;
  final double? elevation;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          textStyle:
              buttonTextStyle ?? AppStyle.boldStyle(color: AppColor.white),
          backgroundColor: backgroundColor,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ), //since this is only a UI app
        child: label,
      ),
    );
  }
}
