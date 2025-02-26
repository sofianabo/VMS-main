import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllTeacherAttendenceModel.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getteacherattendenceapi {
  final Allteacheratendencecontroller c =
      Get.find<Allteacheratendencecontroller>();
  BuildContext context;

  Getteacherattendenceapi(this.context);

  Dio dio = Dio();

  Getteacherattendence({sessionID , String? date}) async {
    try {
      c.setIsLoading(true);
      String myurl = "${global.hostPort}${global.getTeacherAttendance}";
      var response = await dio.post(
          data: {
            "sessionId":sessionID,
            "date":date,
          },
          myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllTeacherAttendenceModel teacher =
            AllTeacherAttendenceModel.fromJson(response.data);
        c.setAllteachers(teacher);
       if(date == null){
         c.removeAttendence();
       }
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
