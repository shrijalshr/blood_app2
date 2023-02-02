import 'package:blood_app/models/location.model.dart';
import 'package:blood_app/services/donor_form_service.dart';
import 'package:blood_app/views/home_screen.dart';
import 'package:get/get.dart';

class DonorFormController extends GetxController {
  Rx<DateTime> dob =
      DateTime.now().subtract(const Duration(days: 365 * 18)).obs;
  Rx<LocationModel> selectedLocation = const LocationModel().obs;
  RxString bloodGroup = "".obs;
  Rx<DateTime> lastDonatedOn = DateTime.now().obs;

  onDobPick(DateTime date) {
    dob.value = date;
  }

  onBloodGroupSelect(String group) {
    bloodGroup.value = group;
  }

  onLocationSelect(LocationModel location) {
    selectedLocation.value = location;
  }

  onLastDonatedPick(DateTime date) {
    lastDonatedOn.value = date;
  }

  RxBool isSubmitting = false.obs;
  Future onSubmit(data) async {
    isSubmitting.value = true;
    DonorFormService service = DonorFormService();
    bool isSuccess = await service.postDonorData(data);
    if (isSuccess) {
      Get.off(const HomeScreen());
    }

    isSubmitting.value = false;
  }
}
