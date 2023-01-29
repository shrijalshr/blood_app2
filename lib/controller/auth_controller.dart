import 'package:blood_app/models/location.model.dart';
import 'package:blood_app/models/user_model.dart';
import 'package:blood_app/services/location_service.dart';
import 'package:blood_app/services/login_service.dart';
import 'package:blood_app/utils/helper/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController username = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  RxBool loginBtnPressed = false.obs;

  UserModel user = UserModel();

  Future<bool> login(String username, String password) async {
    loginBtnPressed.value = true;
    AuthService service = AuthService();
    bool isSuccessful = await service.login("shrijalshr", "password");
    isLoggedIn.value = isSuccessful;
    loginBtnPressed.value = false;
    if (isSuccessful) {
      await getLocations();
      await service.getUser().then((_) {
        user = service.user;
      });
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

  Future<bool> signup(data) async {
    AuthService service = AuthService();
    bool isSuccess = await service.register(data);
    return isSuccess;
  }
}
