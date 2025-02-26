import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/SchoolTimeTableAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/view/Admin/School_Management/SchoolTimeTable.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Deletestudyshareapi {
  BuildContext context;
  Deletestudyshareapi(this.context);
  AdminSchoolTimeController u = Get.find<AdminSchoolTimeController>();

  Dio dio = Dio();
  Deletestudyshare(
    int id,
  ) async {
    String myURI = "$hostPort$deleteStudyShare";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(
        data: {
          "studyShareId": id,
        },
        myURI,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        m = await Schooltimetableapi(context)
            .Schooltimetable(u.examDivision.indexOf(u.selectedExamDivision),u.timeLessonIndex);
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
    } finally {
      Get.back();
    }
    return true;
  }
}
