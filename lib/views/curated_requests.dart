import 'package:blood_app/controller/request_controller.dart';
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
                            child: Center(
                              child: Image.asset("assets/images/empty.jpg"),
                            ),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const RequestTile(
                                requester: "Shrijal Shrestha",
                                patientName: "Someone Someone",
                                address: "Biratnagar-12",
                                hospital: "Nobel Medical Hospital",
                                amount: 2,
                                email: "shrijalshrestha313@gmail.com",
                                phoneNumber: "9804320218",
                                bloodType: "A+",
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
