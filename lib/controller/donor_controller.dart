import 'package:blood_app/services/donor_service.dart';
import '../models/donor_model.dart';
import 'package:get/get.dart';

class DonorController extends GetxController {
  RxInt selectedBloodIndex = 0.obs;
  onBGSelect(bool selected, int index) {
    selectedBloodIndex.value = selected ? index : 0;
  }

  List<DonorModel> donorList = <DonorModel>[].obs;
  getDonors(data) async {
    DonorService service = DonorService();
    await service
        .getDonorList({"location": "1", "blood_request": "A+"}).then((_) {
      donorList = service.donorList;
    });
  }
}
