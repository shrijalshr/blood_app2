import 'package:blood_app/controller/donor_form.dart';
import 'package:blood_app/controller/request_controller.dart';
import 'package:blood_app/models/location.model.dart';
import 'package:blood_app/utils/constants/app_color.dart';
import 'package:blood_app/utils/constants/app_constants.dart';
import 'package:blood_app/utils/constants/app_styles.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/helper/global_functions.dart';
import 'package:blood_app/utils/widgets/dash_container.dart';
import 'package:blood_app/utils/widgets/date_picker/my_date_picker.dart';
import 'package:blood_app/utils/widgets/my_button.dart';
import 'package:blood_app/utils/widgets/my_textfield.dart';
import 'package:blood_app/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonorForm extends StatefulWidget {
  const DonorForm({super.key});

  @override
  State<DonorForm> createState() => _DonorFormState();
}

class _DonorFormState extends State<DonorForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController phoneController;
  late final TextEditingController addressController;
  late final TextEditingController dobController;
  late final TextEditingController bloodGroup;
  late final TextEditingController lastDonatedController;
  late final LocationModel locationModel;

  @override
  void initState() {
    // TODO: implement initState
    phoneController = TextEditingController();
    addressController = TextEditingController();
    lastDonatedController = TextEditingController();
    bloodGroup = TextEditingController();
    locationModel = const LocationModel();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    addressController.dispose();
    lastDonatedController.dispose();
    bloodGroup.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DonorFormController controller = Get.put(DonorFormController());
    final RequestController requestController = Get.find();
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        title: const Text("Donor Form"),
        centerTitle: true,
        titleTextStyle: AppStyle.headingStyle(color: AppColor.darkPrimary),
        backgroundColor: AppColor.white,
        iconTheme: const IconThemeData(color: AppColor.darkPrimary),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fill these fields below.",
            style:
                AppStyle.headingStyle(color: AppColor.darkBlue, fontSize: 16),
          ).p(15, 0, 20, 0),
          DashContainer(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(15),
            borderRadius: 8,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    label: "Phone",
                    textController: phoneController,
                    inputType: TextInputType.phone,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    prefixIcon: const Icon(Icons.phone_outlined),
                    validator: (value) {
                      if (value!.isEmpty || value.trim() == '') {
                        return "Please enter your phone";
                      } else if (!value.isMobileNum()) {
                        return "Please enter a valid phone number";
                      }
                      return null;
                    },
                  ).pb(10),
                  MyDatePicker(
                    onDatePick: (date) {
                      controller.onDobPick(date);
                    },
                    label: "Date of Birth",
                    initialDate: DateTime.now().subtract(
                      const Duration(days: 365 * 18),
                    ),
                    lastDate: DateTime.now().subtract(
                      const Duration(days: 365 * 18),
                    ),
                  ).pb(10),
                  MyTextField(
                    label: "Address",
                    maxLines: 1,
                    textController: addressController,
                    inputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    prefixIcon: const Icon(Icons.person_outline),
                    validator: (value) {
                      if (value!.isEmpty || value.trim() == '') {
                        return "Please enter your last name";
                      } else if (value.length < 2) {
                        return "Please enter a valid last name";
                      }
                      return null;
                    },
                  ).pb(10),
                  DropdownButtonFormField<LocationModel>(
                    validator: (value) {
                      if (value == null) {
                        return "Please select your location";
                      }
                      return null;
                    },
                    items: requestController.locations
                        .map((e) => DropdownMenuItem<LocationModel>(
                              value: e,
                              child: Text(
                                "${e.name}",
                              ),
                            ))
                        .toList(),
                    value: null,
                    // hint: const Text("Location"),
                    dropdownColor: AppColor.lightGrey,
                    focusColor: AppColor.lightGrey,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    decoration: const InputDecoration(
                      label: Text("Location"),
                      prefixIcon: Icon(
                        Icons.place_outlined,
                        color: AppColor.grey,
                      ),
                      fillColor: AppColor.lightGrey,
                      focusColor: AppColor.lightGrey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onChanged: (value) {
                      value != null ? controller.onLocationSelect(value) : null;
                    },
                  ).pb(10),
                  DropdownButtonFormField(
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
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    decoration: const InputDecoration(
                      label: Text("Blood Group"),
                      prefixIcon: Icon(
                        Icons.bloodtype_outlined,
                        color: AppColor.grey,
                      ),
                      fillColor: AppColor.lightGrey,
                      focusColor: AppColor.lightGrey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onChanged: (value) {
                      value != null
                          ? controller.onBloodGroupSelect(value)
                          : null;
                    },
                  ).pb(10),
                  MyDatePicker(
                    onDatePick: (date) {
                      controller.onLastDonatedPick(date);
                    },
                    label: "Last Donated on",
                    initialDate: DateTime.now(),
                    lastDate: DateTime.now(),
                  ).pb(10),
                  Obx(
                    () => MyButton.primary(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var data = {
                            "phone": phoneController.text,
                            "address": addressController.text,
                            "dob": formattedDateYYYYMMDD(controller.dob.value),
                            "location": controller.selectedLocation.value.id,
                            "blood_group": controller.bloodGroup.value,
                            "last_donated": formattedDateYYYYMMDD(
                                controller.lastDonatedOn.value),
                          };
                          print(data);
                          controller.onSubmit(data).then((_) {
                            if (controller.isSuccess.value) {
                              if (context.mounted) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              }
                            }
                          });
                        }
                      },
                      label: controller.isSubmitting.value
                          ? const CircularProgressIndicator()
                          : const Text("Submit"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
