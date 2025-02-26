import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Illness_Model.dart';

class Get_Illness_API {
  BuildContext context;
  Get_Illness_API(this.context);
  Dio dio = Dio();
  Get_Illness({CancelToken? cancelToken}) async {
    final controller = Get.find<Illness_Controller>();

    try {
      controller.SetIsLoading(true);
      String myurl = "${hostPort}${getIllness}";
      var response = await dio.get(
          cancelToken: cancelToken, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Illness_Model illness_model = Illness_Model.fromJson(response.data);
        controller.SetData(illness_model);
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
      return response.statusCode;
    } catch (e) {
      if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
