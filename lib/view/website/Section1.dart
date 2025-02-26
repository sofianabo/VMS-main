// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/HomeScreenController.dart';
import 'package:vms_school/view/Auth/LoginScreen.dart';

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      height: h,
      child: Row(children: [
        Stack(
          children: [
            Image.asset(
              "../../images/Home-Background.png",
              fit: BoxFit.cover,
              height: h / 1.368,
              width: w,
            ),
            SizedBox(
              width: w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "../../images/Home-Background2.png",
                    width: w / 2.84,
                    height: h / 1.52,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: h / 13.68),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("WE CARE ABOUT \n YOUR FUTURE".tr,
                            textAlign: TextAlign.left,
                            style: Get.theme.textTheme.titleLarge!
                                .copyWith(fontSize: 60)),
                        Container(
                          padding: EdgeInsets.only(top: h / 68.4),
                          width: w / 3.2,
                          child: Text(
                            "Join us to enter a better world filled with advanced educational methods through Virtual Modern School",
                            style: Get.theme.textTheme.titleLarge!
                                .copyWith(fontSize: 14),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: h / 22.8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Get.theme.primaryColor,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          height: h / 13.68,
                          width: w / 3.657,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: w / 6.808,
                                  decoration: BoxDecoration(
                                      color: Get.theme.primaryColor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(11),
                                          bottomRight: Radius.circular(11))),
                                  alignment: Alignment.center,
                                  child: Text('Enroll',
                                      style: Get.theme.textTheme.displayMedium!
                                          .copyWith(fontSize: 16)),
                                ),
                                onTap: () {
                                  // Get.to(() => Registration());
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  width: w / 8,
                                  height: h / 13.68,
                                  alignment: Alignment.center,
                                  child: Text('Sign In'.tr,
                                      style: Get.theme.textTheme.titleLarge!
                                          .copyWith(fontSize: 16)),
                                ),
                                onTap: () {
                                  Get.to(
                                    () => LoginScreen(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        GetBuilder<Homescreencontroller>(builder: (control) {
                          return SizedBox(
                            height: h / 3.42,
                            width: w / 3.657,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: h / 5.7,
                                  width: w / 12.8,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFFDFB),
                                      borderRadius: BorderRadius.circular(21),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2.0,
                                      )),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: h / 68.4),
                                        height: h / 17.1,
                                        width: w / 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Image.asset(
                                            "../../images/avatar1.png"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: h / 68.4),
                                        child: Text("${control.teacher}",
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Get
                                                        .theme.primaryColor)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: h / 68.4),
                                        child: Text(
                                          "Teachers",
                                          style: Get
                                              .theme.primaryTextTheme.bodySmall!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      Get.theme.primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: w / 128, right: w / 128),
                                  height: h / 5.7,
                                  width: w / 12.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2.0,
                                      )),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: h / 68.4),
                                        height: h / 17.1,
                                        width: w / 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Image.asset(
                                            "../../images/avatar2.png"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: h / 68.4),
                                        child: Text("${control.student}",
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Get
                                                        .theme.primaryColor)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: h / 68.4),
                                        child: Text("Students",
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: Get
                                                        .theme.primaryColor)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: h / 5.7,
                                  width: w / 12.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2.0,
                                      )),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: h / 68.4),
                                        height: h / 17.1,
                                        width: w / 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Image.asset(
                                            "../../images/avatar3.png"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: h / 68.4),
                                        child: Text("${control.visitor}",
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Get
                                                        .theme.primaryColor)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: h / 68.4),
                                        child: Text("Visitors",
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: Get
                                                        .theme.primaryColor)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
