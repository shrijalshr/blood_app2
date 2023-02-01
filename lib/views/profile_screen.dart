import 'package:blood_app/controller/become_donor_controller.dart';
import 'package:blood_app/controller/profile_controller.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/helper/global_functions.dart';
import 'package:blood_app/utils/widgets/my_textfield.dart';
import 'package:blood_app/views/become_donor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: AppColor.white,
        titleTextStyle: AppStyle.headingStyle(color: AppColor.darkPrimary),
        iconTheme: const IconThemeData(color: AppColor.darkPrimary),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Obx(
          () => controller.isLoading.value
              ? const CircularProgressIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.png"),
                      radius: 32,
                    ).pb(16),
                    Text(
                      "${controller.user.fname} ${controller.user.lname}",
                      style: AppStyle.headingStyle(),
                    ),
                    Text(
                      "@${controller.user.username}",
                      style: AppStyle.subLightStyle(),
                    ),
                    controller.user.hasDonor == true
                        ? Container(
                            child: Column(
                              children: [
                                MyTextField(
                                  label: "Phone",
                                  initialText: controller.donorData.phone,
                                  readOnly: true,
                                ).pb(16),
                                MyTextField(
                                  label: "Blood Group",
                                  initialText: controller.donorData.bloodGroup,
                                  readOnly: true,
                                ).pb(16),
                                MyTextField(
                                  label: "Location",
                                  initialText:
                                      controller.donorData.locationName,
                                  readOnly: true,
                                ).pb(16),
                                MyTextField(
                                  label: "Address",
                                  initialText: controller.donorData.address,
                                  readOnly: true,
                                ).pb(16),
                                MyTextField(
                                  label: "Date of Birth",
                                  initialText: formattedDateYYYYMMDD(
                                      controller.donorData.dob),
                                  readOnly: true,
                                ).pb(16),
                              ],
                            ),
                          ).pa(16)
                        : BecomeDonorBody(
                            controller: Get.put<BecomeDonorController>(
                                BecomeDonorController())),
                  ],
                ),
        ),
      )),
    );
  }
}
