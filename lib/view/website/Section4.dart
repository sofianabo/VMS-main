import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section4 extends StatelessWidget {
  const Section4({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(bottom: h / 45.6),
      width: w / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Get.theme.colorScheme.onPrimary),
      child: Column(
        children: [
          Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: EdgeInsets.only(top: h / 38),
                child: Text("Why Us?",
                    style: Get.theme.textTheme.titleMedium!),
              )),
          SizedBox(
            height: h / 27.36,
          ),
          Text(
              "Virtual Modern School is an online learning platform that helps students to learn the",
              style: Get.theme.textTheme.bodyMedium!),
          Text(
              "Syrian Education Curriculum from home. The courses of this platform are designed",
              style: Get.theme.textTheme.bodyMedium!),
          Text(
              "for elementary school, middle school, and high school all in one place.",
              style: Get.theme.textTheme.bodyMedium!),
          SizedBox(
            height: h / 34.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image1.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Improving educational",
                        style: Get.theme.textTheme.bodyMedium!),
                    Text("Skills", style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image2.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Smart virtual",
                        style: Get.theme.textTheme.bodyMedium!),
                    Text("meeting", style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image3.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Outstanding",
                        style: Get.theme.textTheme.bodyMedium!),
                    Text("user - friendliness",
                        style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 34.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image4.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Instant live",
                        style: Get.theme.textTheme.bodyMedium!),
                    Text("Lessons", style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image5.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Focus on results",
                        style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image6.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Multiple registration",
                        style: Get.theme.textTheme.bodyMedium!),
                    Text("options", style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
