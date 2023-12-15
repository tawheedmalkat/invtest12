import 'package:flutter/material.dart';
import '../../constance/imgaeasset.dart';
import '../../constance/mycolor.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
            vertical: 20,
          ),
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: Image.asset(
              MyImages.logo,
              width: MediaQuery.of(context).size.width * 0.6,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Rubik",
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                ),
              ),
              Image.asset(
                MyImages.img,
                width: MediaQuery.of(context).size.width * 0.05,
                height: MediaQuery.of(context).size.width * 0.05,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: 5),
          child: Text(
            "Log In Invoport",
            style: TextStyle(
              color: MyColor.greydark,
              fontWeight: FontWeight.w400,
              fontFamily: "Rubik",
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
