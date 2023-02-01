import 'dart:convert';

import 'package:blood_app/models/request_mode.dart';
import 'package:blood_app/utils/helper/api.dart';

import '../utils/helper/global_functions.dart';

class RequestService {
  List<RequestModel> requestList = <RequestModel>[];

  Future<bool> postRequest(data) async {
    bool res = await Network().postAuthData(data, "/request/add").then((res) {
      var body = jsonDecode(res.body);
      print(body);
      if (res.statusCode == 200) {
        successSnackBar("Successfully Posted",
            "Your request has been successfully posted.");
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
    return res;
  }

  Future<void> getRequestList(int type) async {
    Network().postAuthData({"type": "2"}, "/request/list?type=2").then((res) {
      var body = jsonDecode(res.body);
      print("From Get Request List----> $body");
      if (res.statusCode == 200) {
        for (var element in body) {
          RequestModel request = RequestModel();
          request = RequestModel.fromJson(element);
          requestList.add(request);
        }
      } else if (res.statusCode == 500) {
        errorSnackbar("Failed to load",
            "You have encountered unexpected error. Please try again.");
      } else if (res.statusCode == 400) {
        errorSnackbar("Failed to Load", "You are not authorized.");
      } else {
        errorSnackbar(
            "Failed to load", "Something went wrong. Please try again.");
      }
    });
  }
}
