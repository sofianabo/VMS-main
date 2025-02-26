import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/SchoolTimeTableAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCuriculmController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownExamTypeController.dart';
import 'package:vms_school/view/Admin/School_Management/SchoolTimeTable.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import '../../../API.dart' as global;

class Addlessonapi {
  AdminSchoolTimeController u = Get.find<AdminSchoolTimeController>();
  Dropdownclassescontroller classControl =
      Get.find<Dropdownclassescontroller>();
  Dropdowncuriculmcontroller curi = Get.find<Dropdowncuriculmcontroller>();
  Dropdowndivisioncontroller div = Get.find<Dropdowndivisioncontroller>();
  Allteachercontroller teach = Get.find<Allteachercontroller>();
  Addlessonapi(this.context);
  BuildContext context;
  Dio dio = Dio();

  Addlesson(
    int curriculumId,
    int divID,
    String perType,
    int teachId,
    int lessonID,
    String day,
  ) async {
    String myurl = "${global.hostPort}${global.addStudyShare}";
    try {
      int? curiID = curi.allCuriculm[curriculumId].id;
      int? divisionID = div.allDivision[divID].id;
      int? teacherID = teach.teachers[teachId].id;
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myurl,
          data: {
            "curriculumId": curiID,
            "teacherId": teacherID,
            "divisionId": divisionID,
            "day": day,
            "lessonId": lessonID,
            "permanentType": perType,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        m = await Schooltimetableapi(context).Schooltimetable(
            u.examDivision.indexOf(u.selectedExamDivision), u.timeLessonIndex);
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
