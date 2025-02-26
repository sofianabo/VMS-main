import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Transaction_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Transaction_Model.dart';

class Get_Transaction_Screen_API {
  BuildContext context;
  Get_Transaction_Screen_API(this.context);

  static Get_Transaction_Screen({String? rows}) async {
    Dio dio = Dio();
    final controller = Get.find<Transaction_Controller>();
    controller.setIsLoading(true);
    try {
      String myurl = "$hostPort$getTransaction";
      var response = await dio.post(
          data: {"rows": rows == "Up 200" ? null : rows},
          myurl,
          options: getDioOptions());
      if (response.statusCode == 200) {
        Transaction_Model transactionModel =
            Transaction_Model.fromJson(response.data);
        controller.setData(transactionModel);
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
