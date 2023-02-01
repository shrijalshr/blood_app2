import 'package:blood_app/controller/request_controller.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/helper/global_functions.dart';
import 'package:blood_app/utils/widgets/my_button.dart';
import 'package:blood_app/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/location.model.dart';
import '../utils/constants/app_constants.dart';
import '../utils/constants/export.dart';
import '../utils/widgets/dash_container.dart';
import '../utils/widgets/date_picker/my_date_picker.dart';

class RequestForm extends StatelessWidget {
  RequestForm({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final RequestController controller = Get.put(RequestController());
    return Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          title: const Text("Request Form"),
          centerTitle: true,
          titleTextStyle: AppStyle.headingStyle(color: AppColor.darkPrimary),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              color: AppColor.darkPrimary,
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Obx(() {
          return controller.isLocationsLoading.value
              ? const CircularProgressIndicator(
                  color: AppColor.darkPrimary,
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: DashContainer(
                      color: AppColor.white,
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyTextField(
                              textController: controller.nameController,
                              label: "Patient Name",
                              validator: (value) {
                                if (value!.isEmpty || value == '') {
                                  return "Please enter patients name";
                                }
                                if (value.length < 2) {
                                  return "Name should have more than one characters.";
                                }
                                return null;
                              },
                            ).pb(15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null) {
                                        return "Please select your blood group.";
                                      }
                                      return null;
                                    },
                                    items: MyConstants.bloodGroups
                                        .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e),
                                            ))
                                        .toList(),
                                    dropdownColor: AppColor.lightGrey,
                                    focusColor: AppColor.lightGrey,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_outlined),
                                    decoration: const InputDecoration(
                                      label: Text("Blood Group"),
                                      prefixIcon: Icon(
                                        Icons.bloodtype_outlined,
                                        color: AppColor.grey,
                                      ),
                                      fillColor: AppColor.lightGrey,
                                      focusColor: AppColor.lightGrey,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                                    onChanged: (value) {
                                      value != null
                                          ? controller.onBloodGroupSelect(value)
                                          : null;
                                    },
                                  ).pb(10),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: MyTextField(
                                    textController: controller.amountController,
                                    label: "Amount (in pint)",
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.trim() == '') {
                                        return 'Please enter required amount in pint';
                                      }
                                      //TODO : Check if not a number
                                      return null;
                                    },
                                  ).pb(15),
                                ),
                              ],
                            ),
                            MyTextField(
                              textController: controller.hospitalController,
                              label: "Hospital",
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.trim() == '') {
                                  return 'Please enter name of hospital';
                                }
                                return null;
                              },
                            ).pb(15),
                            Obx(() {
                              return DropdownButtonFormField<LocationModel>(
                                validator: (value) {
                                  if (value == null) {
                                    return "Please select your location";
                                  } else if (value.name == "Select Location") {
                                    return "Please select your location";
                                  }
                                  return null;
                                },
                                items: controller.locations
                                    .map((e) => DropdownMenuItem<LocationModel>(
                                          value: e,
                                          child: Text(
                                            "${e.name}",
                                          ),
                                        ))
                                    .toList(),
                                value: controller.selectedLocation.value,
                                // hint: const Text("Location"),
                                dropdownColor: AppColor.lightGrey,
                                focusColor: AppColor.lightGrey,
                                icon:
                                    const Icon(Icons.arrow_drop_down_outlined),
                                decoration: const InputDecoration(
                                  label: Text("Location"),
                                  prefixIcon: Icon(
                                    Icons.place_outlined,
                                    color: AppColor.grey,
                                  ),
                                  fillColor: AppColor.lightGrey,
                                  focusColor: AppColor.lightGrey,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                onChanged: (value) {
                                  value != null
                                      ? controller.onLocationSelect(value)
                                      : null;
                                },
                              ).pb(10);
                            }),
                            MyTextField(
                              textController: controller.addressController,
                              label: "Address",
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.trim() == '') {
                                  return 'Please enter address';
                                }
                                //TODO : Check if not a number
                                return null;
                              },
                            ).pb(15),
                            MyTextField(
                              label: "Phone",
                              textController: controller.phoneController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              inputType: TextInputType.phone,
                              maxLines: 1,
                              textInputAction: TextInputAction.next,
                              prefixIcon: const Icon(Icons.phone),
                              validator: (value) {
                                if (value!.isEmpty || value.trim() == '') {
                                  return "Please enter your phone";
                                } else if (!value.isMobileNum()) {
                                  return "Please enter a valid phone number";
                                }
                                return null;
                              },
                            ).pb(10),
                            Obx(() {
                              return MyDatePicker(
                                width: 100.fw,
                                onDatePick: (date) {
                                  controller.onDatePick(date);
                                },
                                initialDate: controller.pickedDate.value,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 10)),
                              ).pb(15);
                            }),
                            Obx(() {
                              return MyButton.primary(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    var data = {
                                      "name":
                                          controller.nameController.value.text,
                                      "address": controller
                                          .addressController.value.text,
                                      "hospital": controller
                                          .hospitalController.value.text,
                                      "blood_group":
                                          controller.bloodGroup.value,
                                      "date": formattedDateYYYYMMDD(
                                          controller.pickedDate.value),
                                      "location":
                                          controller.selectedLocation.value.id,
                                      "amount": controller
                                          .amountController.value.text,
                                      "phone":
                                          controller.phoneController.value.text
                                    };
                                    print(data);

                                    await controller.postRequest(data);

                                    if (controller.isRequestSuccess.value) {
                                      if (context.mounted) {
                                        Get.back();
                                      }
                                    }
                                  }
                                  // controller.getLocations();
                                },
                                label: controller.isPosting.value
                                    ? const CircularProgressIndicator()
                                    : const Text("Make Request"),
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        }));
  }
}
