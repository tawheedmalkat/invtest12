import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:invoportapp/Model/UserModel.dart';
import '../../constance/api.dart';
import '../../constance/routes.dart';
import '../../main.dart';
import 'package:invoportapp/UI/screens/UserDataScreen.dart';

abstract class SignInController extends GetxController {
  signIn(BuildContext context);
}

class SignInControllerImp extends SignInController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController accountController;
  GlobalKey<FormState> scaffoldKey = GlobalKey<FormState>();
  late BuildContext context;
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;

  void updateObscure() {
    obscureText.value = !obscureText.value;
    update();
  }

  bool validateFields() {
    return accountController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  @override
  Future<void> signIn(BuildContext context) async {
    isLoading.value = true;
    update();

    var client = http.Client();
    var url = Uri.parse(ApiLink.Login);

    try {
      var response = await client.post(
        url,
        body: {
          'password': passwordController.text,
          'email':emailController.text,
          'account': accountController.text,
        },
      );

      var responseData = json.decode(response.body);
      if (responseData is List && responseData.isNotEmpty) {
        List<Map<String, dynamic>> listOfMaps =
            List<Map<String, dynamic>>.from(responseData[0]);
        List<UserModel> listOfUserModels =
            listOfMaps.map((map) => UserModel.fromJson(map)).toList();
        listOfUserModels.forEach((userModel) {
          print(
              'Entity ID: ${userModel.entityId}, Entity Name: ${userModel.entityName}');
        });
        isLoading.value = false;
        update();
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.infoReverse,
          animType: AnimType.bottomSlide,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Text(
                  "Do you want to save your \n information ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Rubik",
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Save user information or perform other actions// Example: saveUser(user);
                        sharedPref?.setString('token', 'true');
                        Get.offNamed(AppRoute.home);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('OK'),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        // Get.offNamed(AppRoute.home);
                        Get.to(UserDataScreen(userModels: listOfUserModels,));
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ).show();
      }
      else if (responseData != List){
        isLoading.value = false;
        update();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid data'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } finally {
      client.close();
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    accountController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    accountController.dispose();
    super.dispose();
  }
}
