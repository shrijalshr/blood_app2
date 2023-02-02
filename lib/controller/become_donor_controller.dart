import 'dart:convert';

import 'package:blood_app/models/user_model.dart';
import 'package:blood_app/services/become_donor_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BecomeDonorController extends GetxController {
  late UserModel user;
  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userStr = prefs.getString("user");
    if (userStr != null) {
      var userJson = jsonDecode(userStr);
      user = UserModel.fromJson(userJson);
      becomeDonor.value = user.hasDonor ?? false;
    }
    update();
  }

  RxBool becomeDonor = false.obs;

  onSwitchToggle(value) {
    becomeDonor.value = value;
  }

  RxBool proceed = false.obs;
  RxBool proceeding = false.obs;
  Future onSubmit() async {
    proceeding.value = true;
    BecomeDonorService service = BecomeDonorService();
    int status = becomeDonor.value ? 1 : 0;
    service.postDonorStatus({
      "status": status,
    }).then((res) {
      if (res) {
        proceed.value = res;
      }
    });
    proceeding.value = false;
  }
}
