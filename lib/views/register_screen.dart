import 'package:blood_app/controller/auth_controller.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/widgets/dash_container.dart';
import 'package:blood_app/utils/widgets/my_textfield.dart';
import 'package:blood_app/utils/widgets/password_field.dart';
import 'package:blood_app/views/donor_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/widgets/my_button.dart';
import '../utils/constants/export.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? username;
  TextEditingController? firstName;
  TextEditingController? lastName;
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? confirmPassword;

  @override
  void initState() {
    // TODO: implement initState
    username = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    username?.dispose();
    firstName?.dispose();
    lastName?.dispose();
    email?.dispose();
    password?.dispose();
    confirmPassword?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        title: const Text("Register"),
        centerTitle: true,
        titleTextStyle: AppStyle.headingStyle(color: AppColor.darkPrimary),
        iconTheme: const IconThemeData(color: AppColor.darkPrimary),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: DashContainer(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(15),
            borderRadius: 8,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Join us now.",
                    style: AppStyle.subBoldStyle(
                        fontSize: 24, color: AppColor.darkBlue),
                  ).pb(20),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                          label: "First name",
                          maxLines: 1,
                          textController: firstName,
                          inputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          prefixIcon: const Icon(Icons.person_outline),
                          validator: (value) {
                            if (value!.isEmpty || value.trim() == '') {
                              return "Please enter your first name";
                            } else if (value.length < 2) {
                              return "Please enter a valid first name";
                            }
                            return null;
                          },
                        ).pr(10),
                      ),
                      Expanded(
                          child: MyTextField(
                        label: "Last name",
                        maxLines: 1,
                        textController: lastName,
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
                      )),
                    ],
                  ).pb(10),
                  MyTextField(
                    label: "Username",
                    maxLines: 1,
                    textController: username,
                    inputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    prefixIcon: const Icon(Icons.person_outline),
                    validator: (value) {
                      if (value!.isEmpty || value.trim() == '') {
                        return "Please enter your username";
                      } else if (value.length < 2) {
                        return "Please enter a valid username";
                      }
                      return null;
                    },
                  ).pb(10),
                  MyTextField(
                    label: "Email",
                    maxLines: 1,
                    textController: email,
                    inputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    prefixIcon: const Icon(Icons.call_outlined),
                    validator: (value) {
                      if (value!.isEmpty || value.trim() == '') {
                        return "Please enter your email address";
                      } else if (!value.isEmail) {
                        return "Please enter a valid email address";
                      }

                      return null;
                    },
                  ).pb(10),
                  PasswordField(
                    label: "Password",
                    textEditingController: password,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return "Please enter password";
                      }
                      if (value.trim().isPasswordValid()) {
                        return "Your password should contain at least one capital letter, one small letter, a number, and a special character";
                      }
                      return null;
                    },
                  ).pb(10),
                  PasswordField(
                    label: "Confirm Password",
                    textEditingController: confirmPassword,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return "Please re-enter your password";
                      }
                      return null;
                    },
                  ).pb(20),
                  Obx(() {
                    return MyButton.primary(
                      onPressed: () async {
                        print(username);
                        if (_formKey.currentState!.validate()) {
                          Map<String, String> data = {
                            'username': username!.text,
                            'fname': firstName!.text,
                            'lname': lastName!.text,
                            'email': email!.text,
                            'password': password!.text,
                            'confirm_password': confirmPassword!.text,
                          };
                          print(data);
                          await controller.signup(data);
                          if (controller.isSignUpSuccess.value) {
                            if (context.mounted) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DonorForm()));
                            }
                          }
                        }

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const BecomeDonorScreen()));
                      },
                      label: controller.isSignUpLoading.value
                          ? const CircularProgressIndicator()
                          : const Text("Join Us"),
                    ).pb(10);
                  }),
                ],
              ),
            )),
      ),
    );
  }
}
