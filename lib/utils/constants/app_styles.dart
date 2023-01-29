import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppStyle {
  static TextStyle regularStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.textColor,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w400,
      ));
  static TextStyle lightStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.textColor,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w300,
      )); 

  static TextStyle boldStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.textColor,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w700,
      ));

  static TextStyle semiBold({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.textColor,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w600,
      ));

  static TextStyle mediumStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.textColor,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w500,
      ));

  static TextStyle successRegularStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.green1,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w400,
      ));

  static TextStyle successBoldStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.green1,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.bold,
      ));

  static TextStyle errorRegularStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.error,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w400,
      ));
  static TextStyle errorBoldStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.error,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w700,
      ));

  static TextStyle headingStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.textColor,
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w700,
      ));

  static TextStyle subHeadingStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.textColor,
        fontSize: fontSize ?? 14,
        fontWeight: FontWeight.w600,
      ));
  static TextStyle subLightStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.textColor,
        fontSize: fontSize ?? 10,
        fontWeight: FontWeight.w300,
      ));

  static TextStyle subRegularStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.textColor,
        fontSize: fontSize ?? 10,
        fontWeight: FontWeight.w400,
      ));
  static TextStyle subBoldStyle({Color? color, double? fontSize}) =>
      GoogleFonts.notoSans(
          textStyle: TextStyle(
        color: color ?? AppColor.textColor,
        fontSize: fontSize ?? 10,
        fontWeight: FontWeight.bold,
      ));
}
