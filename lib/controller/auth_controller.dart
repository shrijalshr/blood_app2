import 'package:blood_app/models/location.model.dart';
import 'package:blood_app/models/user_model.dart';
import 'package:blood_app/services/location_service.dart';
import 'package:blood_app/services/auth_service.dart';
import 'package:blood_app/utils/helper/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  TextEditingController username = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  RxBool loginBtnPressed = false.obs;

  UserModel user = UserModel();

  Future<bool> login(String username, String password) async {
    loginBtnPressed.value = true;
    AuthService service = AuthService();
    bool isSuccessful = await service.login(username, password);
    isLoggedIn.value = isSuccessful;
    loginBtnPressed.value = false;
    if (isSuccessful) {
      await getLocations();
      await service.getUser().then((_) {
        user = service.user;
      });

      if (user.hasDonor == true) {
        service.getDonorData();
      }
    }
    return isSuccessful;
  }

  List<LocationModel> locations = [];
  Future<void> getLocations() async {
    LocationService service = LocationService();
    await service.getLocation().then((_) {
      locations = service.locationList;
      print("Locations: $locations");
    });
  }

  Rx<bool> isLoggedIn = false.obs;
  checkLogin() async {
    String? token = await Network().getAccessToken();
    if (token == null) {
      isLoggedIn.value = true;
      update();
    }
  }

  RxBool isSignUpLoading = false.obs;
  RxBool isSignUpSuccess = false.obs;
  Future<void> signup(data) async {
    isSignUpLoading.value = true;
    AuthService service = AuthService();
    service.register(data).then((res) {
      if (res) {
        isSignUpSuccess.value = res;
      }
    });
    isSignUpLoading.value = false;
  }

  Future logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isCleared = await prefs.clear();
    return isCleared;
  }
}
