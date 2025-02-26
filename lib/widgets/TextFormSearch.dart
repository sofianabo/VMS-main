import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Theme/themeController.dart';

class TextFormSearch extends StatelessWidget {
  final TextEditingController controller;
  final IconData suffixIcon;
  final double radius;
  final double? width;
  final ValueChanged<String>? onchange;
  final VoidCallback? click;

  const TextFormSearch({
    super.key,
    required this.controller,
    required this.suffixIcon,
    required this.radius,
    this.width,
    this.click,
    this.onchange,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: width ?? w / 4.4137,
      height: 40,
      child: TextFormField(
        onChanged: onchange,
        style: const TextStyle(fontSize: 14),
        controller: controller,
        decoration: InputDecoration(
          hintText: "Search By Name".tr,
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: GestureDetector(
            onTap: () {
              if (controller.text.isNotEmpty) {
                controller.clear();
                if (click != null) {
                  click!();
                }
              }
            },
            child: Icon(
              suffixIcon,
              color: const Color(0xffB3B3B3),
              size: 16,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Theme.of(context).highlightColor,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Color(0xffB3B3B3)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
