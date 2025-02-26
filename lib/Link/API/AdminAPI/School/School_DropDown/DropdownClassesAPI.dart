import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getallclassapi {
  BuildContext context;
  Getallclassapi(this.context);
  static getAllClasses({int? sessionID, int? Gradeid}) async {
    try {
      Dio dio = Dio();
      Dropdownclassescontroller ClassController =
          Get.find<Dropdownclassescontroller>();
      final Studentcontroller = Get.find<Allstudentscontroller>();
      final StudyYearStudents = Get.find<StudyYearStudentsController>();
      final studentAttendence = Get.find<Student_attendence_controller>();
      final Allteachercontrolle = Get.find<Allteachercontroller>();
      final Allteacheratendencecontrolle =
          Get.find<Allteacheratendencecontroller>();
      final StudentAttendencControlle = Get.find<StudentAttendencController>();
      final addStudentsControlle = Get.find<Add_Students_Controller>();
      final AdminSchoolTimeControllers = Get.find<AdminSchoolTimeController>();

      ClassController.setIsLoading(true);
      Studentcontroller.setClassLoading(true);
      StudyYearStudents.setClassLoading(true);
      studentAttendence.setClassLoading(true);
      Allteachercontrolle.setClassLoading(true);
      Allteacheratendencecontrolle.setClassLoading(true);
      StudentAttendencControlle.setClassLoading(true);
      addStudentsControlle.SetIsLoadingClass(true);
      AdminSchoolTimeControllers.setIsLoadingClass(true);

      final controller = Get.find<Divisions_Controller>();
      controller.SetIsloading(true);
      String myurl = "${global.hostPort}${global.getclasses}";
      var response = await dio.post(
        myurl,
        options: getDioOptions(),
        data: {
          "sessionId": sessionID,
          "gradeId": Gradeid,
        },
      );
      if (response.statusCode == 200) {
        AllClassModel classes = AllClassModel.fromJson(response.data);
        ClassController.setClasses(classes);
        controller.setClass(classes);
        return classes;
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
