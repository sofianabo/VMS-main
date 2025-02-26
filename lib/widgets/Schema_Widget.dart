import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Theme/ThemeData.dart';
import 'package:vms_school/Theme/themeController.dart';


class SchemaWidget extends StatelessWidget {
   SchemaWidget({
    super.key,
    required this.width,
    required this.height,
     this.radius,

  });
  double width;
  double height;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Theme.of(context) == theme.Dark_Theme ? const Color(0xff797777) :const Color(0xffF3F4F8),
          borderRadius: BorderRadius.all(Radius.circular(radius??2))
      ),
    );
  }
}
