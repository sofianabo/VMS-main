import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/HomeScreenController.dart';
import 'package:vms_school/Link/Model/HomeModel.dart';
import 'API.dart' as global;

class Homescreenapi {
  final Homescreencontroller u = Get.find<Homescreencontroller>();
  Homescreenapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  homescreen() async {
    String myurl = "${global.hostPort}${global.Home}";
    try {
      var response = await dio.get(myurl,
          options:getDioOptions());
      HomeModel home = HomeModel.fromJson(response.data);
      u.getHomeInfo(home);
      return response.statusCode;
    } catch (e) {
      print('Login field');
    }
  }
}
