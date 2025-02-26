import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Labrary_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Labrary_Model.dart';

class Get_All_E_Book_API {
  BuildContext context;
  Get_All_E_Book_API(this.context);
  Dio dio = Dio();
  Get_All_E_Book() async {

    final controller = Get.find<Labrary_Controller>();

    try {
      controller.SetIsLoading(true);
      String myurl = "$hostPort$getBook";
      var response = await dio.get(myurl,
          options: getDioOptions());
      if (response.statusCode == 200) {
        Labrary_Model labraryModel = Labrary_Model.fromJson(response.data);
       controller.SetData(labraryModel);
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
