import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllPenaltyModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudyYearModel.dart';


class Study_Year_Students_API {
  Study_Year_Students_API(this.context);
  BuildContext context;
  Dio dio = Dio();
  Study_Year_Students({sessionId}) async {
    String myURI = "$hostPort$getStudyYearStudent";
    try {
      final controller = Get.find<StudyYearStudentsController>();
      controller.setIsLoading(true);
      var response = await dio.post(myURI,
          data: {
          "sessionId":sessionId
          },
          options: getDioOptions());

      if (response.statusCode == 200) {
        AllStudyYearModel allStudyYearModel = AllStudyYearModel.fromJson(response.data);
        controller.setAllStudents(allStudyYearModel);
        Getallgradeapi.Getallgrade();
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




