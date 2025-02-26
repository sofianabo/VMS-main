// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldDialog extends StatelessWidget {
  TextFieldDialog(
      {super.key,
      required this.controller,
      required this.hinttext,
      this.width,
      this.readonly,
      });
  TextEditingController controller = TextEditingController();
  String hinttext = "";
  double? width;
  bool? readonly;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:2.0),
      width: width ?? 250,
      height: 40,
      child: TextFormField(
        readOnly: readonly??false,
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: Get.theme.textTheme.bodyMedium!.copyWith(
            fontSize: 14,
            color: const Color(0xffB3B3B3)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  BorderSide(color: Get.theme.colorScheme.primary, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xffD9D9D9))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
