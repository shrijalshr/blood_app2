import 'package:flutter/material.dart';

import '../constants/screen_util.dart';

extension MobileValidation on String {
  bool isMobileNum() {
    if (length == 10) {
      if (startsWith('98') || startsWith('97')) {
        return true;
      }
    }
    return false;
  }
}

extension SizeExtension on num {
  double get w => ScreenUtil().setWidth(this).toDouble();
  double get h => ScreenUtil().setHeight(this).toDouble();
  double get sp => ScreenUtil().setSp(this).toDouble();
  double get fw => ScreenUtil().partFW(this).toDouble();
  double get fh => ScreenUtil().partFH(this).toDouble();
}

extension PaddingExtension on Widget {
  Widget pa(double a) {
    return Padding(
      padding: EdgeInsets.all(a),
      child: this,
    );
  }

  Widget p([double lp = 0, double rp = 0, double tp = 0, double bp = 0]) {
    return Padding(
      padding: EdgeInsets.only(left: lp, right: rp, top: tp, bottom: bp),
      child: this,
    );
  }

  Widget pt([double top = 0]) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: this,
    );
  }

  Widget pb([double bottom = 0]) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: this,
    );
  }

  Widget pl([double left = 0]) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: this,
    );
  }

  Widget pr([double right = 0]) {
    return Padding(
      padding: EdgeInsets.only(right: right),
      child: this,
    );
  }

  Widget pv([double vertical = 0]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: this,
    );
  }

  Widget ph([double horizontal = 0]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: this,
    );
  }
}

extension PasswordValidation on String {
  bool isPasswordValid() {
    if (length < 8) return false;
    if (!contains(RegExp(r"[a-z]"))) return false;
    if (!contains(RegExp(r"[A-Z]"))) return false;
    if (!contains(RegExp(r"[0-9]"))) return false;
    if (!contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
    return true;
  }
}

extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}
