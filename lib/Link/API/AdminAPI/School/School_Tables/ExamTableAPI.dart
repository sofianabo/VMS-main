import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownExamTypeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownSemsesterAPI.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSemesterModel.dart';
import 'package:vms_school/Link/Model/AdminModel/ExamTableModel.dart';

class Examtableapi {
  final ExamTableController c = Get.find<ExamTableController>();
  BuildContext context;

  Examtableapi(this.context);

  Dio dio = Dio();

  Examtable() async {
    try {
      c.setIsLoading(true);
      AllSemesterModel semester =
          await Dropdownsemsesterapi(context).Dropdownsemsester();
      c.setAllSeason(semester);
      AllClassModel cl = await Getallclassapi.getAllClasses();
      c.setAllClasses(cl);
      c.setAllClassesDialog(cl);
      String myurl = "$hostPort$examTable";
      var response = await dio.post(myurl, data: {}, options: getDioOptions());
      if (response.statusCode == 200) {
        
        ExamTableModel student = ExamTableModel.fromJson(response.data);
        print("sssssssssss");
        c.setAllQuiz(student);
        print("ddddddddd");
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
