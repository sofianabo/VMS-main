import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/GetAllGuardiansAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Addguardianapi {
  final Allgaurdiancontroller u = Get.find<Allgaurdiancontroller>();
  Addguardianapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  addguardian(String name, String email, String nationalid, String phone,
      String username, String password) async {
    String myurl = "${global.hostPort}${global.addGuardian}";
    try {
      var response = await dio.post(myurl,
          data: {
            "name": name,
            "phone": phone,
            "nationalId": nationalid,
            "email": email,
            "userName": username,
            "password": password
          },
          options: getDioOptions());

      if (response.statusCode == 200) {
        await GetAllGuardiansAPI(context).getAllGuardian();
        Get.back();
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
    }
  }
}
