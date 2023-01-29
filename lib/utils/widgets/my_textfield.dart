// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/export.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    this.label,
    this.initialText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.readOnly = false,
    this.validator,
    this.inputType,
    this.textController,
    this.borderRadius,
    this.textInputAction,
    this.onChanged,
    this.onSaved,
    this.inputFormatters,
    this.maxLength,
    this.autoFocus = false,
    this.counter,
    this.hintText,
  }) : super(key: key);

  final String? label;
  final String? initialText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? counter;
  final int? maxLines;
  final bool readOnly;
  final bool autoFocus;
  final int? maxLength;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final double? borderRadius;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      child: TextFormField(
        autofocus: autoFocus,
        maxLength: maxLength,
        validator: validator,
        controller: textController,
        initialValue: initialText,
        keyboardType: inputType,
        readOnly: readOnly,
        inputFormatters: const [],
        textInputAction: textInputAction,
        maxLines: maxLines,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
          labelText: label ?? 'Username',
          hintText: hintText,
          prefixIcon: prefixIcon,
          labelStyle: const TextStyle(fontSize: 15),
          counter: counter,
        ),
        onChanged: onChanged,
        onSaved: onSaved,
      ),
    );
  }
}
