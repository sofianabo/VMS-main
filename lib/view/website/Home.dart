import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/HomeScreenApI.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/website/Appbar.dart';
import 'package:vms_school/view/website/Section1.dart';
import 'package:vms_school/view/website/Section2.dart';
import 'package:vms_school/view/website/Section3.dart';
import 'package:vms_school/view/website/Section4.dart';
import 'package:vms_school/view/website/Section5.dart';
import 'package:vms_school/view/website/Section6.dart';
import 'package:vms_school/view/website/Section7.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Section2Key = new GlobalKey();
  final Section3Key = new GlobalKey();
  final Section4Key = new GlobalKey();
  final Section5Key = new GlobalKey();
  final Section6Key = new GlobalKey();
  final Section7Key = new GlobalKey();

  LocalizationController loc = Get.put(LocalizationController(), permanent: true);

  @override
  void initState() {
    Homescreenapi(context).homescreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: w,
          child: Column(
            children: [
              AppbarCustom(
                Section2Key: Section2Key,
                Section3Key: Section3Key,
                Section4Key: Section4Key,
                Section5Key: Section5Key,
                Section6Key: Section6Key,
                Section7Key: Section7Key,
              ),
              Section1(),
              Section2(
                key: Section2Key,
              ),
              Section3(
                key: Section3Key,
              ),
              Section4(
                key: Section4Key,
              ),
              Section5(
                key: Section5Key,
              ),
              Section6(
                key: Section6Key,
              ),
              Section7(
                key: Section7Key,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
