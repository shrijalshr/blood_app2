import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/export.dart';
import '../../helper/global_functions.dart';
import 'date_picker_controller.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker({
    Key? key,
    this.height = 7.5,
    this.initialDate,
    this.label,
    required this.onDatePick,
    this.firstDate,
    this.lastDate,
    this.width,
  }) : super(key: key);

  final double height;
  final double? width;
  final String? label;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime) onDatePick;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DatePickerController());
    return Container(
      // margin: const EdgeInsets.only(bottom: 7, top: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label ?? "Date",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(
            width: width,
            height: height * 7,
            child: TextButton.icon(
              icon: const Icon(
                Icons.calendar_month_outlined,
                color: AppColor.grey,
                size: 20,
              ),
              onPressed: () async {
                DateTime date = await controller.selectDate(
                    context, initialDate, firstDate, lastDate);
                onDatePick(date);
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColor.white,
                backgroundColor: AppColor.lightGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                side: const BorderSide(
                  color: AppColor.grey,
                  width: .5,
                ),
              ),
              label: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  formattedDateYYYYMMDD(initialDate),
                  style: AppStyle.regularStyle(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
