import 'package:flutter/material.dart';

class CustomHelpText extends StatelessWidget {
  const CustomHelpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery
            .of(context)
            .size
            .height * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HelpText("If you need any help? "),
            const HelpText(
              "Connect with us",
              color: Color(0xff379C42),
            ),
            Icon(
              Icons.add_call,
              color: Color(0xff379C42),
              size: MediaQuery.of(context).size.width * 0.035,
            ),
          ],
        ),
      ],
    );
  }
}

class HelpText extends StatelessWidget {
  final String text;
  final Color? color;

  const HelpText(
      this.text, {
        Key? key,
        this.color,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? MyColor.greydark,
        fontWeight: FontWeight.w400,
        fontFamily: "Rubik",
        fontSize: MediaQuery.of(context).size.width * 0.035,
      ),
    );
  }
}

class MyColor {
  static const Color greydark = Color(0xFF666666);
}
