// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldAuth extends StatelessWidget {
  TextFieldAuth({super.key, required this.controller, required this.hinttext , required this.autofill});
  TextEditingController controller = TextEditingController();
  String hinttext = "";
  Iterable<String> autofill;
  @override
  Widget build(BuildContext context) {
       double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      margin:  EdgeInsets.only(top: h/136.8),
      width: w/2.56,
      height: 50,
      child: TextFormField(
        
        autofillHints: autofill,
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Colors.grey
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  BorderSide(color: Get.theme.colorScheme.primary, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
