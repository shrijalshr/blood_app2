import 'package:blood_app/controller/request_controller.dart';
import 'package:blood_app/models/request_mode.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants/export.dart';
import '../utils/widgets/request_tile.dart';

class CuratedRequests extends StatelessWidget {
  const CuratedRequests({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RequestController controller = Get.put(RequestController());

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Requests",
            style: AppStyle.headingStyle(),
          ).pb(10),
          Expanded(
            child: RefreshIndicator(
              color: AppColor.darkPrimary,
              onRefresh: () {
                return controller.getRequests();
              },
              child: Obx(() {
                return controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.requestList.isEmpty
                        ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Center(
                                  child: Image.asset("assets/images/empty.jpg"),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.requestList.length,
                            itemBuilder: (context, index) {
                              final RequestModel req =
                                  controller.requestList[index];
                              return RequestTile(
                                requester: req.name ?? "",
                                patientName: "Someone Someone",
                                address: req.address ?? "",
                                hospital: req.hospital ?? "",
                                amount: req.amount ?? 1,
                                email: "shrijalshrestha313@gmail.com",
                                phoneNumber: req.phone ?? "",
                                bloodType: req.bloodGroup ?? "",
                              ).pb(15);
                            });
              }),
            ),
          )
        ],
      ),
    );
  }
}
