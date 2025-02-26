import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class Section7 extends StatelessWidget {
  const Section7({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: const Color(0xff21245D),
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      "../../images/section5-image3.png",
                      width: 50,
                      height: 50,
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .rotate(
                            duration: const Duration(seconds: 10),
                            delay: const Duration(milliseconds: 1)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Virtual Modern School",
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 20, color: Colors.white)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            margin: const EdgeInsets.only(left: 150, right: 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Openning Hours",
                        style: Get.theme.textTheme.bodyMedium!
                            .copyWith(fontSize: 16, color: Colors.white)),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text("8 AM -----> 1 PM",
                                style: Get.theme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 16, color: Colors.white)),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "../../images/time-icon.png",
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("3 PM -----> 8 PM",
                                style: Get.theme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 16, color: Colors.white)),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "../../images/time-icon.png",
                              height: 20,
                              width: 20,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "../../images/youtube-icon.png",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "../../images/facebook-icon.png",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "../../images/linkedin-icon.png",
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Row(
                        children: [
                          Text("Contact Details",
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text("SYR: 00963 994 005157",
                                style: Get.theme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 14, color: Colors.white)),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white),
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.call,
                                  color: Get.theme.primaryColor,
                                  size: 16,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("USA: 001 817 583 0666",
                                style: Get.theme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 14, color: Colors.white)),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white),
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.call,
                                  color: Get.theme.primaryColor,
                                  size: 16,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("virtualmodernschoolmedia@gmail.com",
                                style: Get.theme.textTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 16, color: Colors.white)),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white),
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.mail,
                                  color: Get.theme.primaryColor,
                                  size: 16,
                                )),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Shakib Arslan Street - Engineers Syndicate Building - 2nd Floor - AlSuwaidaa - Syria",
                  style: Get.theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 16, color: Colors.white)),
              const SizedBox(
                width: 15,
              ),
              const Icon(
                Icons.location_on_rounded,
                color: Colors.white,
                size: 20,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.copyright_outlined,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(
                width: 3,
              ),
              Text("All Rights reserved. Copyright",
                  style: Get.theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 16, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
