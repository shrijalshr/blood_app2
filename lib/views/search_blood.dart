import 'package:blood_app/controller/donor_controller.dart';
import 'package:blood_app/controller/request_controller.dart';
import 'package:blood_app/models/location.model.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/widgets/dash_container.dart';
import 'package:blood_app/utils/widgets/my_dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/donor_list_model.dart';
import '../utils/constants/app_constants.dart';
import '../utils/constants/export.dart';
import '../utils/widgets/donor_tile.dart';

class SearchBlood extends StatefulWidget {
  const SearchBlood({Key? key, this.hasAppBar = false}) : super(key: key);
  final bool? hasAppBar;
  @override
  State<SearchBlood> createState() => _SearchBloodState();
}

class _SearchBloodState extends State<SearchBlood> {
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DonorController controller = Get.put(DonorController());
    final RequestController reqController = Get.find();
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: widget.hasAppBar!
          ? AppBar(
              title: const Text("Search Blood"),
              titleTextStyle:
                  AppStyle.headingStyle(color: AppColor.darkPrimary),
              centerTitle: true,
              iconTheme: const IconThemeData(color: AppColor.darkPrimary),
              backgroundColor: AppColor.white,
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          right: 15,
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select Blood Group",
              style: AppStyle.headingStyle(
                  color: AppColor.darkPrimary, fontSize: 20.sp),
            ).pb(10),
            DashContainer(
              padding: const EdgeInsets.all(15),
              borderRadius: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DashContainer(
                    width: 100.fw,
                    borderRadius: 15,
                    height: 100,
                    color: AppColor.primary.withOpacity(.1),
                    child: Center(
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 2,
                          ),
                          itemCount: MyConstants.bloodGroups.length,
                          itemBuilder: (context, index) {
                            return Obx(() {
                              return ChoiceChip(
                                avatar: Icon(
                                  Icons.bloodtype,
                                  color: controller.selectedBloodIndex.value ==
                                          index
                                      ? AppColor.white
                                      : AppColor.primary,
                                ),
                                label: Text(MyConstants.bloodGroups[index]),
                                selected: controller.selectedBloodIndex.value ==
                                    index,
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                pressElevation: 02,
                                selectedColor: AppColor.primary,
                                onSelected: (bool selected) {
                                  controller.onBGSelect(selected, index);
                                  print(controller.selectedBloodIndex.value);
                                },
                                backgroundColor:
                                    AppColor.lightGrey.withOpacity(.1),
                                side:
                                    const BorderSide(color: AppColor.lightGrey),
                                labelStyle: TextStyle(
                                    color:
                                        controller.selectedBloodIndex.value ==
                                                index
                                            ? Colors.white
                                            : AppColor.darkPrimary),
                              );
                            });
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyDropdownSearch<LocationModel>(
                    itemList: reqController.locations,
                    itemAsString: (item) => item.name!,
                    label: "Location",
                    fillColor: AppColor.white,
                    showSearchBox: true,
                    hintText: "Select Location",
                    validator: ((value) {
                      if (value == null) {
                        return "Please select your location";
                      }
                      return null;
                    }),
                    prefixIcon: const Icon(
                      Icons.place_outlined,
                      color: AppColor.darkPrimary,
                    ),
                    onChange: (value) {
                      var data = {
                        "location": value?.id ?? 1,
                        "blood_request": MyConstants
                            .bloodGroups[controller.selectedBloodIndex.value],
                      };
                      print(data);
                      controller.getDonors(data);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            controller.isListLoading.value
                ? const Center(child: CircularProgressIndicator())
                : controller.donorList.isEmpty
                    ? Flexible(
                        child: Center(
                            child: Image.asset("assets/images/empty.jpg")))
                    : Flexible(
                        child: ListView.separated(
                          itemCount: controller.donorList.length,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 10),
                          itemBuilder: (context, index) {
                            final DonorListModel donor =
                                controller.donorList[index];
                            return DonorTile(
                              donorName: donor.name ?? "",
                              address: donor.address ?? "",
                              // email: donor.,
                              phoneNumber: donor.phone ?? "",
                              bloodType: donor.bloodGroup ?? "",
                            );
                          },
                          separatorBuilder: ((context, index) =>
                              const Divider()),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
