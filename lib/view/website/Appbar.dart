import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/widgets/Switcher.dart';

class AppbarCustom extends StatefulWidget {
  var Section2Key = GlobalKey();
  var Section3Key = GlobalKey();
  var Section4Key = GlobalKey();
  var Section5Key = GlobalKey();
  var Section6Key = GlobalKey();
  var Section7Key = GlobalKey();

  AppbarCustom({
    super.key,
    required this.Section2Key,
    required this.Section3Key,
    required this.Section4Key,
    required this.Section5Key,
    required this.Section6Key,
    required this.Section7Key,
  });

  @override
  State<AppbarCustom> createState() => _AppbarCustomState();
}

class _AppbarCustomState extends State<AppbarCustom> {
  bool isArabic = true;
  ScrollToKey(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(right: 25, left: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              LanguageSwitcher(
                onLanguageToggle: (bool) {
                  print(bool);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width: 90,
                  height: 20,
                  child: MaterialButton(
                    onPressed: () {
                      ScrollToKey(widget.Section7Key);
                    },
                    child: Text(
                      "Contact Us",
                      style: Get.theme.textTheme.bodyMedium!,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 90,
                height: 20,
                child: MaterialButton(
                  onPressed: () {
                    ScrollToKey(widget.Section5Key);
                  },
                  child: Text(
                    "AboutUs",
                    style: Get.theme.textTheme.bodyMedium!,
                  ),
                ),
              ),
              SizedBox(
                width: 90,
                height: 20,
                child: MaterialButton(
                  onPressed: () {
                    ScrollToKey(widget.Section4Key);
                  },
                  child: Text(
                    "WhyUs",
                    style: Get.theme.textTheme.bodyMedium!,
                  ),
                ),
              ),
              SizedBox(
                width: 90,
                height: 20,
                child: MaterialButton(
                  onPressed: () {
                    ScrollToKey(widget.Section6Key);
                  },
                  child: Text(
                    "Programs",
                    style: Get.theme.textTheme.bodyMedium!,
                  ),
                ),
              ),
              SizedBox(
                width: 90,
                height: 20,
                child: MaterialButton(
                  onPressed: () {
                    ScrollToKey(widget.Section3Key);
                  },
                  child: Text(
                    "Enrollment",
                    style: Get.theme.textTheme.bodyMedium!,
                  ),
                ),
              ),
              SizedBox(
                width: 90,
                height: 20,
                child: MaterialButton(
                  onPressed: () {
                    ScrollToKey(widget.Section2Key);
                  },
                  child: Text(
                    "Eligibility",
                    style: Get.theme.textTheme.bodyMedium!,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "../../images/Logo.png",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
