import 'dart:convert';
import 'package:blood_app/models/location.model.dart';
import 'package:blood_app/utils/helper/api.dart';

import '../utils/helper/global_functions.dart';

class LocationService {
  List<LocationModel> locationList = <LocationModel>[];

  Future<void> getLocation() async {
    await Network().getAuthData("/locations").then((res) {
      print(res.body);
      List body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        print("From Location Service $body");
        for (var e in body) {
          print(e);
          LocationModel locationModel = const LocationModel();
          locationModel = LocationModel.fromMap(e);
          locationList.add(locationModel);
        }
        print("From Location Service $locationList");
      } else if (res.statusCode == 500) {
        errorSnackbar("Failed to load",
            "You have encountered unexpected error. Please try again.");
      } else if (res.statusCode == 400) {
        errorSnackbar("Failed to Load", "You are not authorized.");
      } else {
        errorSnackbar(
            "Failed to load", "Something went wrong. Please try again.");
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      errorSnackbar("Failed to load locations",
          "Please try again later. ${error.toString()}");
    });
  }
}
