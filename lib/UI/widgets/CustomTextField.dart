import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/Auth/SignIn_Controller.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textfieldcontroller;
  final String label;
  final IconData icon;
  final bool isPassword;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.textfieldcontroller,
    required this.label,
    required this.icon,
    required this.isPassword,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return  GetBuilder<SignInControllerImp>(
      builder: (controller) =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08, vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.075,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: MediaQuery.of(context).size.width * 0.002,
                        blurRadius: MediaQuery.of(context).size.width * 0.005,
                        offset: Offset(0, MediaQuery.of(context).size.width * 0.015),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: textfieldcontroller,
                    obscureText: isPassword ? obscureText : false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: isPassword ? "Enter Strong Password" : "Enter Your Email",
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: MediaQuery.of(context).size.width * 0.028,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                        child: Icon(icon, color: Colors.blue),
                      ),
                      suffixIcon: isPassword
                          ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                        child: IconButton(
                          onPressed: () {
                          controller.updateObscure();
                          },
                          icon: Icon(
                            obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Colors.blue,
                          ),
                        ),
                      )
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
    );

  }
}
