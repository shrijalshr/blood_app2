import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    this.textEditingController,
    this.label,
    this.textInputAction,
    this.onChanged,
    this.onSaved,
    this.validator,
  }) : super(key: key);
  final String? label;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        obscureText: true,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          fillColor: const Color(0xfff5f5f5),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: label ?? 'Password',
          prefixIcon: const Icon(Icons.lock_outline),
          labelStyle: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
