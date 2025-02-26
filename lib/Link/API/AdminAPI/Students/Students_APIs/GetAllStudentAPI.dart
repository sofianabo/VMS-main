import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudentModel.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Getallstudentapi {
  BuildContext context;

  Getallstudentapi(this.context);

  static Getallstudent({
    sessionID,
  }) async {
    try {
      final Allstudentscontroller c = gets.Get.find<Allstudentscontroller>();
      Dio dio = Dio();
      c.setIsLoading(true);
      FormData formData = FormData();

      if (sessionID != null &&
          sessionID.toString().trim().isNotEmpty &&
          sessionID.toString() != "null") {
        formData.fields.add(MapEntry("sessionId", sessionID));
      }

      String myurl = "$hostPort$getStudents";
      var response =
          await dio.post(myurl, data: formData, options: getDioOptions());
      if (response.statusCode == 200) {
        c.setIsLoading(false);
        AllStudentModel student = AllStudentModel.fromJson(response.data);
        c.setAllStudents(student);
        Getallgradeapi.Getallgrade();
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
