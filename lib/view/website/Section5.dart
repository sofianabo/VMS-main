// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section5 extends StatelessWidget {
  const Section5({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: h / 6.84),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: h / 25),
            child: Text("Who Are We",
                style: Get.theme.textTheme.titleMedium!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                          "is a community of learners, including students, parents, and staff, dedicated to creating a rigorous and",
                          style: Get.theme.textTheme.bodyMedium!),
                      Text("VIRTUAL MODERN SCHOOL (VMS)",
                          style: Get.theme.textTheme.bodyMedium!),
                    ],
                  ),
                  Text(
                      " inclusive educational environment. VMS students are goal-oriented, critical thinkers, and community leaders ",
                      style: Get.theme.textTheme.bodyMedium!),
                  Text(
                    "committed to achieving high levels of integrity and academic success.",
                    style: Get.theme.textTheme.bodyMedium!,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "../../images/section5-image1.png",
                            height: h / 1.71,
                            width: w / 12.8,
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Container(
                            width: w / 1.6,
                            height: h / 2.28,
                            padding: EdgeInsets.only(top: h / 22.8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffeaf0ff)),
                            child: Column(
                              children: [
                                Text(
                                    "VIRTUAL MODERN SCHOOL (VMS) staff aim to create a supportive",
                                    style:
                                        Get.theme.textTheme.bodyMedium!),
                                Text(
                                    "and challenging environment for all students to reach their potential,",
                                    style:
                                        Get.theme.textTheme.bodyMedium!),
                                Text(
                                    "engaging in continuous improvement through goal setting and",
                                    style:
                                        Get.theme.textTheme.bodyMedium!),
                                Text("reflection",
                                    style:
                                        Get.theme.textTheme.bodyMedium!),
                                SizedBox(
                                  height: h / 34.2,
                                ),
                                Image.asset(
                                  "../../images/section5-image3.png",
                                  height: h / 6.84,
                                  width: w / 12.8,
                                ),
                                SizedBox(
                                  height: h / 34.2,
                                ),
                                Text("Virtual Modern School",
                                    style: Get
                                        .theme.primaryTextTheme.titleSmall!
                                        .copyWith(color: Colors.black))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w / 25.6,
                          ),
                          Image.asset(
                            "../../images/section5-image2.png",
                            height: h / 1.71,
                            width: w / 12.8,
                          ),
                        ],
                      ),
                      Image.asset(
                        "../../images/section5-image4.png",
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
