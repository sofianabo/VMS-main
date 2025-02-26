import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Virtual_Employee_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/viraul_Classes_Model.dart';
import '../../../API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Get_Admin_Class_API {
  BuildContext context;
  Get_Admin_Class_API(this.context);
  Dio dio = Dio();
  Get_Admin_Class() async {
    try {
      final controller = Get.find<Virtual_Employee_Controller>();
      controller.SetIsLoading(true);
      String myurl = "$hostPort$getClassUser";
      var response = await dio.get(myurl,
          options: getDioOptions());
      if (response.statusCode == 200) {
        viraul_Classes_Model vcm = viraul_Classes_Model.fromJson(response.data);
        controller.SetVirtualClass(vcm);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
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
