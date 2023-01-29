import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/widgets/my_button.dart';
import 'package:blood_app/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

import '../utils/constants/export.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColor.darkPrimary,
        ),
        title: const Text("Reset Your Password"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 100.fh - 70,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset("assets/images/forgot_password.jpg",
                      height: 36.fh),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Forgot Password?',
                    style: AppStyle.headingStyle(
                        fontSize: 30.sp, color: AppColor.primary),
                  ),
                ).pb(20),
                MyTextField(
                  label: "Enter Mobile Number",
                  inputType: TextInputType.phone,
                  maxLength: 10,
                  counter: const SizedBox(),
                  validator: (value) {
                    if (value!.isEmpty || value == '') {
                      return "Please enter your mobile number";
                    }
                    if (value.isMobileNum()) {
                      return "Please enter valid mobile number.";
                    }
                    return null;
                  },
                ).pb(10),
                Text(
                  "An One-Time-Password (OTP) will be sent to you in the number you provide.",
                  style: AppStyle.subLightStyle(),
                ).pb(20),
                MyButton.primary(
                  label: const Text("Send"),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Navigator.pushNamed(context, Routes.otpVerification);
                    }
                  },
                ).pb(20),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  child: Text("Back to login", style: AppStyle.subLightStyle()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
