import 'package:blood_app/services/become_donor_service.dart';
import 'package:get/get.dart';

class BecomeDonorController extends GetxController {
  RxBool becomeDonor = false.obs;

  onSwitchToogle(value) {
    becomeDonor.value = value;
    print(becomeDonor);
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
