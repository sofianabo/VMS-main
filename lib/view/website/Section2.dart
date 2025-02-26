// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin:  EdgeInsets.only(top: h/8.55),
      child: Column(
        children: [
          Text("Who Can We Register At Virtual Modern School",
              style: Get.theme.textTheme.titleMedium!.copyWith(
                fontSize: 24,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: h / 38),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                "Anyone who resides outside Syria desires to learn the Syrian Educational Curriculums from Elementary",
                                style: Get.theme.textTheme.bodyMedium!),
                            Text(
                                "to Middle and High schools can enroll and graduate to be awarded the High school Diploma granted",
                                style: Get.theme.textTheme.bodyMedium!),
                            Text(
                                "by the Ministry of Education at Syrian Arab Republic",
                                style: Get.theme.textTheme.bodyMedium!),
                          ],
                        ),
                        SizedBox(
                          width: w / 64,
                        ),
                        Container(
                          height: h / 22.8,
                          width: w / 42.66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: const Color(0xff47ccaa),
                          ),
                          child: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h / 34.2,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              "People with special needs who are residing in Syria are uncapable to study in regular schools uncapable",
                              style: Get.theme.textTheme.bodyMedium!),
                          Text(
                              "to study uncapable to study in regular schools and exceptional students cases determined by the",
                              style: Get.theme.textTheme.bodyMedium!),
                          Text(
                              "Ministry of Education at Syrian Arab Diploma granted by the Ministry of Education at Syrian Arab",
                              style: Get.theme.textTheme.bodyMedium!),
                          Text("Republic",
                              style: Get.theme.textTheme.bodyMedium!),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: h / 22.4,
                        width: w / 42.66,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: const Color(0xff946ffb)),
                        child: const Icon(
                          Icons.emoji_events_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Image.asset(
                "../../images/section2-image1.png",
                height: h / 1.52,
                width: w / 2.56,
              )
            ],
          ),
        ],
      ),
    );
  }
}
