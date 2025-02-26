import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Increase_Attendance_Model.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Stu_Attendence.dart';

class IncreaseAttendanceAPI {



  BuildContext context;
  IncreaseAttendanceAPI(this.context);
  Dio dio = Dio();
  final Student_attendence_controller  controller = Get.find<Student_attendence_controller>();

  GetIncreaseAttendance({
    String? gradeid , String? classId ,String? divisionId,required isserch
}) async {
    try {

      controller.setIsLoading(true);
      controller.setIsUploded(false,"Attendance Today Has Been Uploaded");
      String myurl = "$hostPort$studentsAttendance";
      var response = await dio.post(
          data: {
            "gradeId":gradeid,
            "classId":classId,
            "divisionId":divisionId,
          },
          myurl,
      options: getDioOptions());
      print("${response.statusCode}");
      if (response.statusCode == 200) {
        StuAttendence stu = StuAttendence.fromJson(response.data);
        controller.setData(stu);
      } else if(response.statusCode == 232) {
        controller.setIsLoading(false);
        controller.setIsUploded(true,"Attendance Today Has Been Uploaded");
      }
      else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {

      if (e is DioException) {
       if( e.response?.statusCode == 404){

         controller.setIsLoading(false);
         if(divisionId != null){
           controller.setIsUploded(true,"There Are No Students In This Division");
         } else  if(classId != null){
           controller.setIsUploded(true,"There Are No Students In This Class");
         } else {
           controller.setIsUploded(true,"There Are No Students In This Grade");
         }


       }else{
         ErrorHandler.handleDioError(e);
       }
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
