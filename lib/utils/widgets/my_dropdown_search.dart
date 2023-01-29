import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../constants/export.dart';

class MyDropdownSearch<T> extends StatelessWidget {
  const MyDropdownSearch({
    Key? key,
    this.label,
    this.buttonHeight,
    required this.itemList,
    this.popupItemDisabled,
    this.onChange,
    this.selectedItem,
    this.fillColor,
    this.hintText,
    required this.validator,
    this.prefixIcon,
    this.showSearchBox = false,
    this.itemAsString,
  }) : super(key: key);

  final String? label;
  final double? buttonHeight;
  final List<T> itemList;
  final bool Function(T)? popupItemDisabled;
  final void Function(T?)? onChange;
  final String? Function(T? value) validator;
  final T? selectedItem;
  final Color? fillColor;
  final Widget? prefixIcon;
  final bool? showSearchBox;
  final String Function(T)? itemAsString;

  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 8.fh,
      child: DropdownSearch<T>(
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            focusColor: AppColor.primary.withOpacity(.3),
            fillColor: fillColor ?? AppColor.lightGrey,
            filled: true,
            hintText: hintText,
            hintStyle: AppStyle.subLightStyle(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: prefixIcon,
            labelText: label,
            labelStyle: const TextStyle(fontSize: 15),
          ),
        ),
        itemAsString: itemAsString,
        validator: validator,
        items: itemList,
        onChanged: onChange,
        selectedItem: selectedItem,
        popupProps: PopupProps<T>.menu(
          showSearchBox: showSearchBox!,
        ),
      ),
    );
  }
}
