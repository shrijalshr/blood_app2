import 'dart:convert';

import 'package:blood_app/utils/helper/api.dart';

import '../utils/helper/global_functions.dart';

class BecomeDonorService {
  Future<bool> postDonorStatus(data) async {
    bool res =
        await Network().postAuthData(data, "/donor/changeStatus").then((res) {
      print(res.body);
      var body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        print(body);
        return true;
      } else if (body["status"] == 401) {
        errorSnackbar("Invalid Username/Password",
            "Username or password did not match. Try again");
        return false;
      } else if (body["status"] == 400) {
        errorSnackbar("Invalid Login", "Please provide valid email/password.");
        return false;
      } else {
        errorSnackbar("Something went wron  g", "Please try again later");
        return false;
      }
    });
    return res;
  }
}
