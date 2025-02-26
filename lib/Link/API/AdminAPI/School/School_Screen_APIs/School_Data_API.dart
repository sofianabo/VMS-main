import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/School_Data_Model.dart';


class School_Data_API {
  School_Data_API(this.context);
  BuildContext context;
  Dio dio = Dio();
  School_Data() async {
    String myURI = "$hostPort$getSchoolData";
    try {
      final controller = Get.find<SchoolInfoController>();
      controller.setIsLoading(true);
      var response = await dio.get(myURI,
          options: getDioOptions());
      if (response.statusCode == 200) {
        School_Data_Model schoolDataModel = School_Data_Model.fromJson(response.data);
        controller.setData(schoolDataModel.data);
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
