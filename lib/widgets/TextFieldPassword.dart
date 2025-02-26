import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/WidgetController/PasswordHintController.dart';

class TextFormPassword extends StatelessWidget {
  PasswordHintController pass = Get.find();

  TextEditingController controller;
  String hinttext;
  Iterable<String> autofill ;

  TextFormPassword({
    super.key,
    required this.controller,
    required this.hinttext, required this.autofill,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      margin:  EdgeInsets.only(top: h/136.8),
      width: w / 2.56,
      height: 50,
      child: GetBuilder<PasswordHintController>(builder: (password) {
        return TextFormField(
          autofillHints: autofill,
          controller: controller,
          obscureText: pass.isVisible,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(
                fontSize: 12,
                color: Colors.grey
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
              child: IconButton(
                onPressed: () {
                  pass.isVisible ? pass.hint() : pass.notHint();
                },
                icon:  pass.isVisible ? const Icon(
                  Icons.visibility_off ,
                  color: Colors.grey,
                ) : const Icon(Icons.visibility,
                  color: Colors.grey,
                ),
              ),
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
        );
      }),
    );
  }
}
