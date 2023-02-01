import 'dart:convert';

import 'package:blood_app/utils/helper/api.dart';

import '../utils/helper/global_functions.dart';

class DonorFormService {
  Future<bool> postDonorData(data) async {
    await Network().postAuthData(data, "/donor").then((res) {
      var body = jsonDecode(res.body);
      print("From DonorForm Service $body");
      if (res.statusCode == 200) {
        return true;
      } else if (res.statusCode == 500) {
        errorSnackbar("Failed to load",
            "You have encountered unexpected error. Please try again.");
        return false;
      } else if (res.statusCode == 400) {
        errorSnackbar("Failed to Load", "You are not authorized.");
        return false;
      } else {
        errorSnackbar(
            "Failed to load", "Something went wrong. Please try again.");
        return false;
      }
    });
    return false;
  }
}
