// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonDialog extends StatelessWidget {
  ButtonDialog(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      this.textcolor,
      this.bordercolor,
      required this.width,
      this.height});
  final VoidCallback onPressed;
  Color color;
  Color? bordercolor;
  Color? textcolor;
  String text;
  double width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: bordercolor ?? Colors.transparent)),
          onPressed: onPressed,
          color: color,
          child: Text(text,
              style: Get.theme.textTheme.displayMedium!.copyWith(
                  fontFamily: "Cairo", color: textcolor ?? Colors.white))),
    );
  }
}

class ButtonDashboard extends StatelessWidget {
  ButtonDashboard(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      this.textcolor,
      this.bordercolor,
      required this.width});

  final VoidCallback onPressed;
  Color color;
  Color? bordercolor;
  Color? textcolor;
  String text;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                  color: bordercolor ?? Colors.transparent, width: 0.3)),
          onPressed: onPressed,
          color: color,
          child: Text(text,
              style: Get.theme.textTheme.displayMedium!.copyWith(
                  fontFamily: "Cairo",
                  color: textcolor ?? Colors.white,
                  fontSize: 12))),
    );
  }
}
