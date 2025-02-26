import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Dashboard_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/Dashboard_Model.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Dashboard_API {
  final controller = Get.find<Dashboard_Controller>();
  final sessionCont = Get.find<All_Screen_Sessions_Controller>();

  Dashboard_API(this.context);

  BuildContext context;
  Dio dio = Dio();

  initDashboard() async {
    String myurl = "$hostPort$dashboard";
    bool isSuccessful = false;
    int retryCount = 0;
    const int maxRetries = 5;

    while (!isSuccessful && retryCount < maxRetries) {
      try {
        print("Attempt ${retryCount + 1} of $maxRetries...");
        var response = await dio.get(
          myurl,
          options: getDioOptions(),
        );

        if (response.statusCode == 200) {

          DashboardModel dashboardModel =
          DashboardModel.fromJson(response.data);
          controller.AddData(dashboardModel);
          AllSessionModel allSessionModel =
          AllSessionModel.fromJson(response.data['session']);
          sessionCont.setAllSession(allSessionModel);
          isSuccessful = true;
        } else {
          print(
              "Request failed with status: ${response.statusCode}. Retrying...");
          retryCount++;
        }
      } catch (e) {
        print("An error occurred: $e. Retrying...");
        retryCount++;
      }

      if (!isSuccessful && retryCount < maxRetries) {
        await Future.delayed(const Duration(seconds: 2));
      }
    }

    if (!isSuccessful) {
      print("Failed to fetch data after $maxRetries attempts.");
      Get.snackbar(
        "Error",
        "Unable to fetch dashboard data after multiple attempts.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
