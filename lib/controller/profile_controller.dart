import 'dart:convert';

import 'package:blood_app/models/donor_model.dart';
import 'package:blood_app/models/user_model.dart';
import 'package:blood_app/utils/helper/global_functions.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getUserDetail();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  UserModel user = UserModel();
  RxBool isDonor = false.obs;
  getUserDetail() async {
    isLoading.value = true;
    String userStr = await getJsonFromSP("user");
    var userObj = json.decode(userStr);
    user = UserModel.fromJson(userObj);
    isDonor.value = user.hasDonor ?? false;
    if (isDonor.value) {
      getDonorDetail();
    }
    isLoading.value = false;

    print(user.toString());
  }

  DonorModel donorData = DonorModel();
  getDonorDetail() async {
    String donorStr = await getJsonFromSP("donor_data");
    var donorJson = json.decode(donorStr);
    donorData = DonorModel.fromJson(donorJson);
    // print(donorData.)
  }
}
