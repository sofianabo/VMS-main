import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudentAttendenceModel.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Studentattendenceapi {
  final StudentAttendencController c = Get.find<StudentAttendencController>();
  BuildContext context;

  Studentattendenceapi(this.context);

  Dio dio = Dio();

  Studentattendence({int? sessionID, date}) async {
    try {
      c.setIsLoading(true);

      String myurl = "$hostPort$studentAttenendnce";
      var response = await dio.post(myurl,
          data: {
            "sessionId": sessionID,
            "date": date,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        AllStudentAttendenceModel student =
            AllStudentAttendenceModel.fromJson(response.data);
        c.setAllStudents(student);
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
