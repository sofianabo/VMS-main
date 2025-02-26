import 'package:flutter/material.dart';

class LargeTextField extends StatelessWidget {
  const LargeTextField({
    super.key,
    required this.controller,
    this.width,
    required this.hinttext,
    this.isRequired = false, // إضافة متغير لتحديد ما إذا كان الحقل مطلوبًا.
  });

  final TextEditingController controller;
  final String hinttext;
  final double? width;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 515,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: RichText(
              text: TextSpan(
                text: hinttext,
                style: Theme.of(context).textTheme.bodyMedium,
                children: isRequired
                    ? [
                        const TextSpan(
                          text: " *",
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
          TextFormField(
            maxLines: 10,
            controller: controller,
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: const TextStyle(color: Color(0xffD9D9D9)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xffD9D9D9), width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffD9D9D9))),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
