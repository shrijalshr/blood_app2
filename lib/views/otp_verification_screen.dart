import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/widgets/my_button.dart';
import 'package:blood_app/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants/export.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Image.asset("assets/images.otp.png", height: 36.fh),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    MyTextField(
                      autoFocus: true,
                      inputType: TextInputType.number,
                      label: "Enter OTP",
                      maxLength: 4,
                      counter: const SizedBox(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    MyButton.primary(
                      onPressed: () {},
                      label: const Text("Verify"),
                    ),
                  ],
                ),
              ),
              Text(
                "Didn't you receive any code?",
                style: AppStyle.lightStyle(),
                textAlign: TextAlign.center,
              ).pt(20),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Resend New Code",
                  style: AppStyle.boldStyle(),
                  textAlign: TextAlign.center,
                ),
              ).pv(10),
            ],
          ),
        ),
      ),
    );
  }
}
