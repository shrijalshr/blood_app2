import 'package:blood_app/controller/donor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/donor_list_model.dart';
import '../utils/constants/export.dart';
import '../utils/widgets/donor_tile.dart';

class DonorListScreen extends StatelessWidget {
  const DonorListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DonorController controller = Get.put(DonorController());
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: const Text(
          "Donors List",
        ),
        centerTitle: true,
        titleTextStyle: AppStyle.headingStyle(color: AppColor.darkPrimary),
        iconTheme: const IconThemeData(color: AppColor.darkPrimary),
      ),
      body: ListView.separated(
        itemCount: controller.donorList.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 10),
        itemBuilder: (context, index) {
          final DonorListModel donor = controller.donorList[index];
          return DonorTile(
            donorName: donor.name ?? "",
            address: donor.address ?? "",
            // email: donor.,
            phoneNumber: donor.phone ?? "",
            bloodType: donor.bloodGroup ?? "",
          );
        },
        separatorBuilder: ((context, index) => const Divider()),
      ),
    );
  }
}
