import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/Auth/SignIn_Controller.dart';
import '../widgets/CustomHelpText.dart';
import '../widgets/CustomLoginButton.dart';
import '../widgets/CustomTextField.dart';
import '../widgets/LoginHeader.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return GetBuilder<SignInControllerImp>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LoginHeader(),
                Form(
                    key: controller.scaffoldKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextField(
                            textfieldcontroller: controller.accountController,
                            label: 'Account',
                            icon: Icons.person,
                            isPassword: false,
                            obscureText: false,
                            valid: (value) {
                              if (value!.isEmpty|| value!.isNumericOnly) {
                                return 'Account is required';
                              }

                              return null; // Return null if the email is valid
                            },
                          ),
                          CustomTextField(
                            textfieldcontroller: controller.emailController,
                            label: 'Email',
                            icon: Icons.email,
                            isPassword: false,
                            obscureText: false,
                            valid: (value) {
                              if (value!.isEmpty||!value.isEmail) {
                                return 'Email is required';
                              }

                              return null; // Return null if the email is valid
                            },
                          ),
                          CustomTextField(
                            textfieldcontroller: controller.passwordController,
                            label: 'Password',
                            icon: Icons.password,
                            isPassword: true,
                            obscureText:
                                bool.parse(controller.obscureText.toString()),
                            valid: (value) {
                              if (value!.isEmpty||!value.isNumericOnly) {
                                return 'Password is required';
                              }

                              return null; // Return null if the email is valid.
                            },
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: CustomLoginButton(
                    label: 'Log In',
                    onPressed: () async {
                      await controller.signIn(context);
                    },
                    isLoading: controller.isLoading(),
                  ),
                ),
                const CustomHelpText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
