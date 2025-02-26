import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Dropdowndivisionapi {
  Dropdowndivisioncontroller c = Get.find<Dropdowndivisioncontroller>();
  final Allstudentscontroller stuc = Get.find<Allstudentscontroller>();
  final StudyYearController = Get.find<StudyYearStudentsController>();
  final Student_attendence = Get.find<Student_attendence_controller>();
  final StudentAttendencControlle = Get.find<StudentAttendencController>();
  final Add_Students_Controlle = Get.find<Add_Students_Controller>();
  final AdminSchoolTimeControllers = Get.find<AdminSchoolTimeController>();

  Dropdownclassescontroller class_controller =
      Get.find<Dropdownclassescontroller>();
  BuildContext context;
  Dropdowndivisionapi(this.context);
  Dio dio = Dio();

  Dropdowndivision(int idx, int idx2) async {
    try {
      c.setIsLoading(true);
      stuc.setDivisionLoading(true);
      StudyYearController.setDivisionLoading(true);
      Student_attendence.setDivisionLoading(true);
      StudentAttendencControlle.setDivisionLoading(true);
      Add_Students_Controlle.SetIsLoadingDivision(true);
      AdminSchoolTimeControllers.setIsLoadingDivision(true);

      int? id = class_controller.Allclass[idx].id;
      String myurl = "$hostPort$getDivision";
      var response = await dio.post(myurl,
          data: {"classId": id}, options: getDioOptions());
      if (response.statusCode == 200) {
        AllDivisionModel division = AllDivisionModel.fromJson(response.data);
        c.setDivision(division);
        return division;
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
