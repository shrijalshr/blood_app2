import 'package:blood_app/models/location.model.dart';
import 'package:blood_app/models/request_mode.dart';
import 'package:blood_app/services/location_service.dart';
import 'package:blood_app/services/request_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getRequests();
    nameController = TextEditingController();
    amountController = TextEditingController();
    hospitalController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    getLocations();
    print("object");
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    nameController.dispose();
    amountController.dispose();
    hospitalController.dispose();
    addressController.dispose();
    phoneController.dispose();

    super.onClose();
  }

  RxList<LocationModel> locations = <LocationModel>[].obs;
  RxBool isLocationsLoading = false.obs;
  Future<void> getLocations() async {
    isLocationsLoading.value = true;
    LocationService service = LocationService();
    await service.getLocation();
    locations.assignAll(service.locationList);
    locations.insert(0, selectedLocation.value);
    print("Location from Req Controller: $locations");

    isLocationsLoading.value = false;
  }

  RxList<RequestModel> requestList = <RequestModel>[].obs;
  RxBool isLoading = false.obs;
  Future<void> getRequests() async {
    isLoading.value = true;
    RequestService service = RequestService();
    await service.getRequestList(2).then((_) {
      requestList.assignAll(service.requestList);
    });
    isLoading.value = false;
    update();
  }

  late TextEditingController nameController = TextEditingController();
  late TextEditingController amountController = TextEditingController();
  late TextEditingController hospitalController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  RxString bloodGroup = "".obs;
  Rx<LocationModel> selectedLocation =
      const LocationModel(id: 0, name: "Select Location").obs;
  RxBool isPosting = false.obs;
  Rx<DateTime> pickedDate = DateTime.now().obs;

  onBloodGroupSelect(String group) {
    bloodGroup.value = group;
  }

  onLocationSelect(LocationModel location) {
    selectedLocation.value = location;
  }

  onDatePick(date) {
    pickedDate.value = date;
  }

  RxBool isRequestSuccess = false.obs;
  Future<void> postRequest(data) async {
    isPosting.value = true;
    RequestService service = RequestService();
    service.postRequest(data).then((bool res) {
      print(res);
      if (res == true) {
        isRequestSuccess.value = true;
      }
    });
    isPosting.value = false;
  }
}
