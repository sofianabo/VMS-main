import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownExamTypeController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownSemsterController.dart';
import 'package:vms_school/Link/Model/AdminModel/ExamTypeModel.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Dropdownexamtypeapi {
  Dropdownexamtypecontroller c = Get.find<Dropdownexamtypecontroller>();
  Dropdownsemstercontroller semster = Get.find<Dropdownsemstercontroller>();
  BuildContext context;

  Dropdownexamtypeapi(this.context);
  Dio dio = Dio();

  Dropdownexamtype(int ids) async {
    try {
      int? id = semster.allSemester[ids].id;
      String myurl = "${global.hostPort}${global.examType}/$id";
      var response = await dio.get(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllExamTypeModel types = AllExamTypeModel.fromJson(response.data);
        c.setTypes(types);
        return types;
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
