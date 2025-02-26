import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Model/AdminModel/IncreaseTeacherAttendenceModel.dart';

class Increaseteacherattendenceapi {
  BuildContext context;
  Increaseteacherattendenceapi(this.context);

  static Increaseteacherattendence() async {
    Dio dio = Dio();

    final EmployeeController AttendenceController =
        Get.find<EmployeeController>();
    AttendenceController.setIsload(true);

    try {
      String myurl = "$hostPort$teacherIncreaseAttendance";
      var response = await dio.get(data: {}, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        IncreaseTeacherAttendenceModel teacher =
            IncreaseTeacherAttendenceModel.fromJson(response.data);
        AttendenceController.setTeacherData(teacher);
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
