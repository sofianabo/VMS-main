import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCuriculmController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownExamTypeController.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import '../../../API.dart' as global;

class Addquizapi {
  ExamTableController u = Get.find<ExamTableController>();
  Dropdownclassescontroller classControl =
      Get.find<Dropdownclassescontroller>();
  Dropdowncuriculmcontroller curi = Get.find<Dropdowncuriculmcontroller>();
  Dropdownexamtypecontroller type = Get.find<Dropdownexamtypecontroller>();
  Addquizapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Addquiz(
    int curriculumId,
    int typeId,
    String startDate,
    String period,
    int name,
    String maxMark,
    String PassingMark,
  ) async {
    String myurl = "${global.hostPort}${global.addQuiz}";
    try {
      int? cID = classControl.Allclass[name].id;
      int? curiID = curi.allCuriculm[curriculumId].id;
      int? typeID = type.alltype[typeId].id;
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myurl,
          data: {
            "curriculumId": curiID,
            "typeId": typeID,
            "startDate": startDate,
            "period": period,
            "maxMark": maxMark,
            "PassingMark": PassingMark,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        await Examtableapi(context).Examtable();
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
