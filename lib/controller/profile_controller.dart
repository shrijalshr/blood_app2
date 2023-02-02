import 'package:blood_app/models/donor_model.dart';
import 'package:blood_app/models/user_model.dart';
import 'package:blood_app/services/auth_service.dart';
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
    AuthService service = AuthService();
    await service.getUser();
    user = service.user;
    isDonor.value = user.hasDonor ?? false;
    if (isDonor.value) {
      getDonorDetail();
    }
    isLoading.value = false;
    print(user.toString());
  }

  DonorModel donorData = DonorModel();
  getDonorDetail() async {
    isLoading.value = true;
    AuthService service = AuthService();
    bool isSuccess = await service.getDonorData();
    if (isSuccess) {
      donorData = service.donorData;
      print(donorData.address);
    }
    isLoading.value = false;
  }
}
