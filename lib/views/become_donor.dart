import 'package:blood_app/controller/become_donor_controller.dart';
import 'package:blood_app/utils/constants/app_color.dart';
import 'package:blood_app/utils/constants/app_styles.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/widgets/dash_container.dart';
import 'package:blood_app/views/donor_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/widgets/my_button.dart';

class BecomeDonorScreen extends StatelessWidget {
  const BecomeDonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BecomeDonorController controller = Get.put(BecomeDonorController());
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        title: const Text("Become a donor"),
        centerTitle: true,
        backgroundColor: AppColor.white,
        titleTextStyle: AppStyle.headingStyle(color: AppColor.darkPrimary),
        iconTheme: const IconThemeData(color: AppColor.darkPrimary),
      ),
      body: SingleChildScrollView(
        child: BecomeDonorBody(controller: controller),
      ),
    );
  }
}

class BecomeDonorBody extends StatelessWidget {
  const BecomeDonorBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BecomeDonorController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashContainer(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Become a donor?",
                          style: AppStyle.boldStyle(),
                        ),
                        Text(
                          "You shall be listed as donor in future.",
                          style: AppStyle.subLightStyle(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Obx(
                        () => Switch.adaptive(
                            value: controller.becomeDonor.value,
                            onChanged: (value) {
                              controller.onSwitchToogle(value);
                            }),
                      ),
                    ),
                  )
                ],
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: MyButton.primary(
              //     onPressed: () {},
              //     width: 100,
              //     height: 36,
              //     label: const Text("Proceed"),
              //   ),
              // )
            ],
          ),
        ),
        Obx(
          () => MyButton.primary(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DonorForm()));
              // controller.onSubmit().then((_) {
              //   if (controller.proceed.value) {
              //     if (context.mounted) {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const DonorForm()));
              //     }
              //   }

              // });
            },
            label: controller.proceeding.value
                ? const CircularProgressIndicator()
                : const Text("Proceed"),
          ).ph(15),
        ),
      ],
    );
  }
}
