import 'dart:convert';

import 'package:blood_app/utils/constants/app_color.dart';
import 'package:blood_app/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

/// 2023-01-23
String formattedDateYYYYMMDD(DateTime? date) {
  final format = DateFormat("yyyy-MM-dd");
  final formattedDate = format.format(date ?? DateTime.now());
  // print(formattedDate);
  return formattedDate;
}

/// Thu, Jan 27, 2005
String formattedDateYYYYMDD(DateTime? date) {
  final format = DateFormat.yMMMEd();
  final formattedDate = format.format(date ?? DateTime.now());
  // print(formattedDate);
  return formattedDate;
}

addStringToSP(name, string) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(name, string);
}

addJsonToSP(name, Object object) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(name, jsonEncode(object));
}

getJsonFromSP(name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? objStr = prefs.getString(name);
  return objStr;
}

void launchURL(url) async {
  if (!await launchUrl(url)) throw 'Could not launch $url';
}

void launchInWeb(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw "Couldn't launch $url";
  }
}

void launchInCall(String number) async {
  final Uri url = Uri(scheme: 'tel', path: number);
  await launchUrl(url);
}

void launchInSMS(String number) async {
  final Uri url = Uri(scheme: 'sms', path: number);
  await launchUrl(url);
}

void launchInEmail(String email) async {
  // String body ="This is a request for blood donation for $patientName requested by $requestedBy. ";

  final Uri url = Uri(
    scheme: 'mailto',
    path: email,
    query: encodeQueryParameters(<String, String>{
      'subject': 'Request for Blood Donation!',
    }),
  );
  await launchUrl(url);
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

errorSnackbar(String? title, String? message) {
  GetSnackBar snackbar = GetSnackBar(
    isDismissible: true,
    dismissDirection: DismissDirection.down,

    titleText: Text(
      title ?? "Invalid Inputs",
      style: AppStyle.regularStyle(color: AppColor.white),
    ),
    messageText: Text(
      message ?? "Please try again with valid data.",
      style: AppStyle.regularStyle(color: AppColor.white),
    ),
    icon: const Icon(
      Icons.error_outline,
      color: AppColor.white,
      size: 28,
    ),
    duration: const Duration(milliseconds: 3000),
    animationDuration: const Duration(milliseconds: 500),
    snackPosition: SnackPosition.BOTTOM,

    // snackStyle: SnackStyle.FLOATING,
    backgroundColor: AppColor.primary,
    margin: const EdgeInsets.only(
      left: 5,
      right: 5,
      bottom: 5,
    ),
  );
  Get.showSnackbar(snackbar);
}

successSnackBar(String? title, String? message) {
  GetSnackBar snackbar = GetSnackBar(
    titleText: Text(
      title ?? "Successfully Saved",
      style: AppStyle.boldStyle(color: AppColor.green2),
    ),
    messageText: Text(
      message ?? "The data has been successfully saved.",
      style: AppStyle.boldStyle(color: AppColor.green2),
    ),
    isDismissible: true,
    duration: const Duration(milliseconds: 3000),

    dismissDirection: DismissDirection.down,
    animationDuration: const Duration(milliseconds: 500),
    snackPosition: SnackPosition.BOTTOM,

    // snackStyle: SnackStyle.FLOATING,
    backgroundColor: Colors.white70,
    margin: const EdgeInsets.only(
      left: 5,
      right: 5,
      bottom: 5,
    ),
  );

  Get.showSnackbar(snackbar);
}
