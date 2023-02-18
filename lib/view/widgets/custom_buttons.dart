import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/view/widgets/custom_text.dart';

Widget CustomButton(String text, Widget icon, VoidCallback onTap, double width,
    double height, tColor, bgColor) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: bgColor,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomText(text, tColor, 14.0, FontWeight.w400),
        icon,
      ]),
    ),
  );
}

Widget SocialButton(Widget icon, String text, VoidCallback onTap, double width,
    double height, Color textColor, Color bgColor) {
  return InkWell(
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: bgColor),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        CustomText(text, textColor, 16.0, FontWeight.w600),
      ]),
    ),
  );
}
