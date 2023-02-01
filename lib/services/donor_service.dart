import 'dart:convert';

import 'package:blood_app/models/donor_list_model.dart';
import 'package:blood_app/utils/helper/api.dart';

import '../utils/helper/global_functions.dart';

class DonorService {
  List<DonorListModel> donorList = <DonorListModel>[];

  Future<void> getDonorList(data) async {
    await Network().postAuthData(data, "/donor/list").then((res) {
      var body = jsonDecode(res.body);
      print(body);
      if (res.statusCode == 200) {
        for (var e in body) {
          DonorListModel donor = DonorListModel();
          donor = DonorListModel.fromJson(e);
          donorList.add(donor);
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

  // Future getAllDonor() {}
}
