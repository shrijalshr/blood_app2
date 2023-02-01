import 'dart:convert';
import 'dart:developer';
import 'package:blood_app/models/donor_model.dart';

import '../utils/helper/api.dart';
import '../utils/helper/global_functions.dart';
import 'package:blood_app/models/user_model.dart';

class AuthService {
  Future<bool> login(String? username, String? password) async {
    var res = await Network()
        .postData({'username': username, 'password': password}, "/token/");
    if (res != null) {
      log(res.body);
      Map body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        print(body);
        addStringToSP("accessToken", body['access']);
        addStringToSP("refreshToken", body['refresh']);

        return true;
      } else if (body["status"] == 401) {
        errorSnackbar("Invalid Username/Password",
            "Username or password did not match. Try again");
        return false;
      } else if (body["status"] == 400) {
        errorSnackbar("Invalid Login", "Please provide valid email/password.");
        return false;
      } else {
        return false;
      }
    } else {
      errorSnackbar("Something went wrong", "Please try again later");
      return false;
    }
  }

  Future<bool> register(Map<String, dynamic> data) async {
    bool res = await Network().postData(data, "/register/").then(
      (res) {
        if (res != null) {
          print(res.statusCode);
          print(res.body);
          Map body = jsonDecode(res.body);
          if (res.statusCode == 200) {
            print(body);
            addStringToSP("accessToken", body['access']);
            addStringToSP("refreshToken", body['refresh']);
            return true;
          } else if (body["status"] == 401) {
            errorSnackbar("Invalid Username/Password",
                "Username or password did not match. Try again");
            return false;
          } else if (body["status"] == 400) {
            errorSnackbar(
                "Invalid Login", "Please provide valid email/password.");
            return false;
          } else if (body["status"] == 406) {
            errorSnackbar("", body['error']);
            return false;
          } else {
            errorSnackbar("Something went wrong", "Please try again later");
            return false;
          }
        } else {
          errorSnackbar("Something went wrong", "Please try again later");
          return false;
        }
      },
    ).onError((error, stackTrace) => errorSnackbar(
        "Something went wrong", "Please try again later. $error"));

    return res;
  }

  UserModel user = UserModel();
  Future<void> getUser() async {
    await Network().getAuthData("/user").then((res) {
      if (res != null) {
        print(res);
        if (res.statusCode == 200) {
          var body = jsonDecode(res.body);
          print("From Get User-----> $body");
          UserModel userModel = UserModel();
          userModel = UserModel.fromJson(body);
          user = userModel;
          addJsonToSP("user", userModel);
        } else if (res.statusCode == 500) {
          errorSnackbar("Failed to load",
              "You have encountered unexpected error. Please try again.");
        } else if (res.statusCode == 400) {
          errorSnackbar("Failed to Load", "You are not authorized.");
        } else {
          errorSnackbar(
              "Failed to load", "Something went wrong. Please try again.");
        }
      } else {
        errorSnackbar(
            "Failed to load", "Something went wrong. Please try again.");
      }
    });
  }

  DonorModel donorData = DonorModel();
  getDonorData() async {
    await Network().getAuthData("/donor").then((res) {
      if (res != null) {
        print(res);
        if (res.statusCode == 200) {
          var body = jsonDecode(res.body);
          print("From Get Donor Data-----> $body");
          DonorModel donor = DonorModel();
          donor = DonorModel.fromJson(body);
          donorData = donor;
          addJsonToSP("donor_data", donorData);
        } else if (res.statusCode == 500) {
          errorSnackbar("Failed to load",
              "You have encountered unexpected error. Please try again.");
        } else if (res.statusCode == 400) {
          errorSnackbar("Failed to Load", "You are not authorized.");
        } else {
          errorSnackbar(
              "Failed to load", "Something went wrong. Please try again.");
        }
      } else {
        errorSnackbar(
            "Failed to load", "Something went wrong. Please try again.");
      }
    });
  }
}
