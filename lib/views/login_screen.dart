import 'package:blood_app/controller/auth_controller.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/views/home_screen.dart';
import 'package:blood_app/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/export.dart';
import '../utils/widgets/my_button.dart';
import '../utils/widgets/my_textfield.dart';
import '../utils/widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Container(
                  color: AppColor.white,
                  height: 30.fh,
                  width: 100.fw,
                  child: Image.asset(
                    "assets/images/login.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                width: 100.fw,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: const LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController? username;
  TextEditingController? password;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    username = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    username?.dispose();
    password?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              'Login',
              style:
                  AppStyle.headingStyle(color: AppColor.darkBlue, fontSize: 24),
            ).pb(20),
            Username(username: username).pb(10),
            Password(password: password).pb(10),
            MyButton.primary(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  controller
                      .login(username!.text, password!.text)
                      .then((value) {
                    if (controller.isLoggedIn.value) {
                      Get.off(() => const HomeScreen());
                    }
                  });
                }
              },
              label: Obx(
                () => controller.loginBtnPressed.value
                    ? const CircularProgressIndicator(
                        color: AppColor.white,
                      )
                    : const Text("Login"),
              ),
            ).pb(10),
            // GestureDetector(
            //   onTap: () {},
            //   child: Text(
            //     'Forgot your password?',
            //     style: AppStyle.regularStyle(),
            //   ).pb(10),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?\t",
                  style: AppStyle.regularStyle(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const RegisterScreen());
                  },
                  child: Text(
                    "Join Us",
                    style: AppStyle.regularStyle(color: AppColor.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Password extends StatelessWidget {
  const Password({
    Key? key,
    required this.password,
  }) : super(key: key);

  final TextEditingController? password;

  @override
  Widget build(BuildContext context) {
    return PasswordField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your password";
        }
        return null;
      },
      textEditingController: password,
    );
  }
}

class Username extends StatelessWidget {
  const Username({
    Key? key,
    required this.username,
  }) : super(key: key);

  final TextEditingController? username;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      label: "Username",
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter valid username";
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      prefixIcon: const Icon(Icons.person_outline),
      textController: username,
    );
  }
}
