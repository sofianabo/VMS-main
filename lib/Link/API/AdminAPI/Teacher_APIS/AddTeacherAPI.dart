import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Addteacherapi {
  Allteachercontroller u = Get.find<Allteachercontroller>();
  Addteacherapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Addteacher(
    String firstName,
    String lastName,
    String email,
    String username,
    String date,
    String phone,
    String gender,
    String contractType,
    String roll,
    String jobTitle,
    String password,
  ) async {
    String myurl = "${global.hostPort}${global.addEmpolyee}";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myurl,
          data: {
            "firstName": firstName,
            "lastName": lastName,
            "gender": gender,
            "joinDate": date,
            "contractType": contractType,
            "phone": phone,
            "roll": roll,
            "email": email,
            "userName": username,
            "jobTitle": jobTitle,
            "password": password
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get.back();

        Get_All_Employee_API
            .Get_All_Employee();

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
