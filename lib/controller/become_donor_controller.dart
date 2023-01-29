import 'package:get/get.dart';

class BecomeDonorController extends GetxController {
  RxBool becomeDonor = false.obs;

  onSwitchToogle(value) {
    becomeDonor.value = value;
    print(becomeDonor);
  }
}
