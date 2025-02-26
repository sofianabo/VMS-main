import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';

class LanguageSwitcher extends StatefulWidget {
  final Function(bool) onLanguageToggle; // دالة للتعامل مع تغيير اللغة

  const LanguageSwitcher({super.key, required this.onLanguageToggle});

  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher>
    with SingleTickerProviderStateMixin {
  bool isArabic = false; // الحالة الأولية: الإنجليزية
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 3, end: 45).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          if (controller.currentLocale.value.languageCode == 'ar') {
            controller.changeLanguage(const Locale('en'));
          } else {
            controller.changeLanguage(const Locale('ar'));
          }
        },
        child: Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Get.theme.primaryColor),
            color: controller.currentLocale.value.languageCode == 'ar'
                ? Colors.white
                : Get.theme.primaryColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Positioned(
                    left: controller.currentLocale.value.languageCode == 'ar'
                        ? _animation.value
                        : null,
                    right: controller.currentLocale.value.languageCode == 'en'
                        ? _animation.value
                        : null, // موضع الكرة
                    child: Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color:
                            controller.currentLocale.value.languageCode == 'ar'
                                ? Get.theme.primaryColor
                                : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:
                    controller.currentLocale.value.languageCode == 'ar'
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.currentLocale.value.languageCode == 'ar'
                          ? 'العربية'
                          : 'English',
                      style: TextStyle(
                        fontFamily: "Cairo",
                        color:
                            controller.currentLocale.value.languageCode == 'ar'
                                ? Get.theme.primaryColor
                                : Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
