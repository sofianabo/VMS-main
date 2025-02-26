import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_Virtual_Employee.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Delete_Virtual_User_API {
  Delete_Virtual_User_API(this.context);
  BuildContext context;
  Dio dio = Dio();
  Delete_Virtual_User({int? id}) async {
    String myurl = "${global.hostPort}${global.deleteVirtualEmployee}/$id";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.delete(myurl,
          cancelToken: cancelToken,
     options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        await Get_Virtual_Employee_API.Get_Virtual_Employee();
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
