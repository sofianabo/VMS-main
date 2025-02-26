import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/Link/Model/AuthModel/UserModel.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/AdminHome.dart';
import '../API.dart' as global;

class LoginAPI {
  final UserController u = Get.find<UserController>();
  LoginAPI(this.context);
  BuildContext context;
  Dio dio = Dio();
  login(String username, String password) async {
    String myurl = "${global.hostPort}${global.LOGIN}";
    try {
       u.SetIsloading(true);
      var response = await dio.post(myurl,
          data: {
            "userName": username,
            "password": password,
          },
           options: getDioOptions());
      if (response.statusCode == 200) {

        UserModel user = UserModel.fromJson(response.data);
        u.GetuserInfo(user);
        prefs!.setBool("isLogin", true);
        Get.to(() => AdminHome(),);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }finally{
      u.SetIsloading(false);
    }
  }
}
