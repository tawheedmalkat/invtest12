import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/Auth/SignIn_Controller.dart';
//
class CustomTextField extends StatelessWidget {
  final TextEditingController textfieldcontroller;
  final String label;
  final IconData icon;
  final bool isPassword;
  final bool obscureText;
  final String? Function(String?) valid;

  const CustomTextField({
    Key? key,
    required this.textfieldcontroller,
    required this.label,
    required this.icon,
    required this.isPassword,
    required this.obscureText,
    required this.valid,
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
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
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

                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,),
                      child: TextFormField(
                        cursorColor: Colors.blue,
                        validator: valid,
                        controller: textfieldcontroller,
                        obscureText: isPassword ? obscureText : false,
                        decoration: InputDecoration(
                          hintText:  "Enter Your ${label}" ,
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
                  ],
                ),
              ),
            ],
          ),
    );

  }
}
