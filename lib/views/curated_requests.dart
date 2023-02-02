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
    this.hasAppBar = false,
  }) : super(key: key);

  final bool? hasAppBar;

  @override
  Widget build(BuildContext context) {
    final RequestController controller = Get.put(RequestController());

    return Scaffold(
      appBar: hasAppBar!
          ? AppBar(
              title: const Text("Recent Requests"),
              centerTitle: true,
              iconTheme: const IconThemeData(
                color: AppColor.primary,
              ),
              backgroundColor: AppColor.white,
            )
          : null,
      body: Padding(
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
                      // ignore: prefer_is_empty
                      : controller.requestList.length != 0
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.requestList.length,
                              itemBuilder: (context, index) {
                                final RequestModel req =
                                    controller.requestList[index];
                                return RequestTile(
                                  id: req.id ?? 0,
                                  patientName: req.name ?? "",
                                  address: req.address ?? "",
                                  hospital: req.hospital ?? "",
                                  amount: req.amount ?? 1,
                                  email: "shrijalshrestha313@gmail.com",
                                  phoneNumber: req.phone ?? "",
                                  bloodType: req.bloodGroup ?? "",
                                ).pb(15);
                              })
                          : SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Center(
                                    child:
                                        Image.asset("assets/images/empty.jpg"),
                                  ),
                                ],
                              ),
                            );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
