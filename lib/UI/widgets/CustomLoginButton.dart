import 'package:flutter/material.dart';

import '../../constance/imgaeasset.dart';

class CustomLoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomLoginButton(
      {super.key, required this.onPressed, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 10),
      child: isLoading
          ? CircularProgressIndicator() // Show loading indicator
          : ElevatedButton.icon(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff03A8EA),
                minimumSize: Size(
                    double.infinity, MediaQuery.of(context).size.height * 0.07),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
              ),
              icon: Image.asset(
                MyImages.img_2,
                width: 20,
                height: 20,
              ),
              label: Text("Log In", style: TextStyle(color: Colors.white)),
            ),
    );
  }
}
