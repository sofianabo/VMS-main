import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Student_Info_model.dart';
import 'package:vms_school/view/Admin/Students_Manager/EditStudentInfo.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Get_Students_Information_API {
  Get_Students_Information_API(this.context);
  BuildContext context;
  Dio dio = Dio();
  Get_Students_Information({required StudentsID, required int index}) async {
    String myURI = "${hostPort}${getStudentInformation}";
    try {
      final controller = Get.find<Allstudentscontroller>();
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myURI,
          data: {"studentId": StudentsID}, options: getDioOptions());
      if (response.statusCode == 200) {
        Student_Info_model student_info_model =
            Student_Info_model.fromJson(response.data);
        controller.Set_Selected_Student(student_info_model);
        Get.back();
        EditStudentDialog(index, context);
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
