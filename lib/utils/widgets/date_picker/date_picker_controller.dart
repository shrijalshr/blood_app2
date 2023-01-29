import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerController extends GetxController {
  var pickedDate = DateTime.now().obs;

  selectDate(BuildContext context, DateTime? initialDate, DateTime? firstDate,
      DateTime? lastDate) async {
    pickedDate.value = initialDate!;

    final ThemeData theme = Theme.of(context);

    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(
            context, initialDate, firstDate, lastDate);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(
            context, initialDate, firstDate, lastDate);
    }
  }

  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context, DateTime? initialDate,
      DateTime? firstDate, DateTime? lastDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: pickedDate.value,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2025),
    );
    if (picked != null && picked != initialDate) pickedDate.value = picked;
    update();
    return pickedDate.value;
  }

  /// This builds cupertino date picker in iOS
  buildCupertinoDatePicker(BuildContext context, DateTime? initialDate,
      DateTime? firstDate, DateTime? lastDate) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (pickedDate.value != initialDate) {
                  pickedDate.value = picked;
                }
              },
              initialDateTime: pickedDate.value,
              minimumYear: firstDate != null ? firstDate.year.toInt() : 2000,
              maximumYear: lastDate != null ? lastDate.year.toInt() : 2025,
            ),
          );
        });
    update();
    return pickedDate.value;
  }
}
