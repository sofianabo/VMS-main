// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonsGrid extends StatelessWidget {
  ButtonsGrid(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,required this.width,required this.height});
  final VoidCallback onPressed;
  Color color;
  String text;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,//w / 9.846
      height: height,// h / 22.8
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: onPressed,
          color: color,
          child: Text(text, style: Get.theme.textTheme.displayMedium!)),
    );
  }
}
