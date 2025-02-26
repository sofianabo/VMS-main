import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownGradeController.dart.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getallgradeapi {

  BuildContext context;
  Getallgradeapi(this.context);


  static Getallgrade() async {
    Dio dio = Dio();
    try {
      Dropdowngradecontroller c = Get.find<Dropdowngradecontroller>();
      final StudentAttendencControlle = Get.find<StudentAttendencController>();
      final controller = Get.find<Allstudentscontroller>();
      final SYStudentsController = Get.find<StudyYearStudentsController>();
      final stuattendence = Get.find<Student_attendence_controller>();



      controller.setGradeLoading(true);
      SYStudentsController.setGradeLoading(true);
      stuattendence.setGradeLoading(true);
      StudentAttendencControlle.setGradeLoading(true);

      String myurl = "${global.hostPort}${global.getGrade}";
      var response = await dio.get(myurl,
options: getDioOptions());
      if (response.statusCode == 200) {
        AllGradesModel grade = AllGradesModel.fromJson(response.data);
        c.setGrades(grade);
        return grade;
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
