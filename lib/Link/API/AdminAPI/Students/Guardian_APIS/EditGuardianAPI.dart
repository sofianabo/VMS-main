import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Editguardianapi {
  final Allgaurdiancontroller u = Get.find<Allgaurdiancontroller>();
  Editguardianapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Editguardian(int id, String name, String email, String nationalid,
      String phone, int index) async {
    String myurl = "$hostPort$editGuardian";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myurl,
          cancelToken: cancelToken,
          data: {
            "name": name,
            "phone": phone,
            "nationalId": nationalid,
            "guardianId": id,
            "email":email
          },
options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        u.updateGuardian(name, index, phone, email, nationalid);
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
