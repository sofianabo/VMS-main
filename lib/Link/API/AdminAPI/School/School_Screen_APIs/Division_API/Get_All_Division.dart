import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Division_Model.dart';

class Get_All_Division_API {
  BuildContext context;
  Get_All_Division_API(this.context);
  Dio dio = Dio();
  Get_All_Division({sessionId}) async {
    final controller = Get.find<Divisions_Controller>();
    controller.SetIsapiloading(true);
    try {
      String myurl = "$hostPort$getAllDivision";
      var response = await dio.post(myurl,
          data: {
            'sessionId':sessionId
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
       Division_Model allDivisionModel = Division_Model.fromJson(response.data);
       controller.setDivisions(allDivisionModel);
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
