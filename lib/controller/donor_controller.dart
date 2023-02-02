import 'package:blood_app/models/location.model.dart';
import 'package:blood_app/services/donor_service.dart';
import '../models/donor_list_model.dart';
import 'package:get/get.dart';

import '../utils/constants/app_constants.dart';

class DonorController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    // getDonors(data);
    print("object");
    super.onInit();
  }

  RxInt selectedBloodIndex = 0.obs;
  onBGSelect(bool selected, int index) {
    selectedBloodIndex.value = selected ? index : 0;
    if (selectedLocation != null && selectedLocation?.value.id == 0) {
      var data = {
        "location": selectedLocation?.value.id ?? 1,
        "blood_request": MyConstants.bloodGroups[selectedBloodIndex.value],
      };
      getDonors(data);
    }
  }

  Rx<LocationModel>? selectedLocation;
  onLocationChange(LocationModel location) {
    selectedLocation?.value = location;
    var data = {
      "location": location.id ?? 1,
      "blood_request": MyConstants.bloodGroups[selectedBloodIndex.value],
    };
    getDonors(data);
    update();
  }

  RxBool isListLoading = false.obs;
  List<DonorListModel> donorList = <DonorListModel>[].obs;
  getDonors(data) async {
    isListLoading.value = true;
    DonorService service = DonorService();
    await service.getDonorList(data).then((_) {
      donorList = service.donorList;
    });
    isListLoading.value = false;
  }

  // RxBool isAllListLoading = false.obs;
  // List<DonorModel> allDonorList = <DonorModel>[].obs;
  // getAllDonors(data) async {
  //   isAllListLoading.value = true;
  //   DonorService service = DonorService();
  //   await service
  //       .getALlDonorList({"location": "1", "blood_request": "A+"}).then((_) {
  //     donorList = service.donorList;
  //   });
  //   isAllListLoading.value = false;
  // }
}
