import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/UserModel.dart';
import '../../constance/imgaeasset.dart';
import '../../constance/mycolor.dart';
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
        builder: (controller) =>
            Scaffold(
              key: controller.scaffoldKey,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const LoginHeader(),
                        CustomTextField(
                          textfieldcontroller: controller.accountController,
                          label: 'Account',
                          icon: Icons.person,
                          isPassword: false,
                          obscureText: false,
                        ),
                        CustomTextField(
                          textfieldcontroller: controller.emailController,
                          label: 'Email',
                          icon: Icons.email,
                          isPassword: false,
                          obscureText: false,
                        ),
                        CustomTextField(
                          textfieldcontroller: controller.passwordController,
                          label: 'Password',
                          icon: Icons.password,
                          isPassword: true,
                          obscureText: bool.parse(controller.obscureText.toString()),
                        ),
                        CustomLoginButton(
                          onPressed: () async {
                            await controller.signIn(context);
                          },
                          isLoading: controller.isLoading(),
                        ),

                        const CustomHelpText(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
