import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Labrary_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Vaccines_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Labrary_Model.dart';

class Get_Vaccines_API {
  BuildContext context;
  Get_Vaccines_API(this.context);
  Dio dio = Dio();
  Get_Vaccines({CancelToken? cancelToken}) async {
    final controller = Get.find<Vaccines_Controller>();

    try {
      controller.SetIsLoading(true);
      String myurl = "${hostPort}${getVaccine}";
      var response = await dio.get(
          cancelToken: cancelToken, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Vaccines_Model Vaccines_model = Vaccines_Model.fromJson(response.data);
        controller.SetData(Vaccines_model);
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
