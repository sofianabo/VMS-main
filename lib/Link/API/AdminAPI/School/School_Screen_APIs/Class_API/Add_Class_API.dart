import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Get_All_Classes.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Add_Class_API {
  BuildContext context;
  Add_Class_API(this.context);
  Dio dio = Dio();

  Add_Class({
    userId,
    sessionId,
    gradeId,
    driveUrl,
    name,
    enName,
    curriculum,
  }) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      String myurl = "$hostPort$addClass";
      var response = await dio.post(
          cancelToken: cancelToken,
          myurl,
          data: {
            'userId': '$userId',
            'sessionId': '$sessionId',
            'gradeId': '$gradeId',
            'driveUrl': '$driveUrl',
            'name': '$name',
            'enName': '$enName',
            'curriculum': curriculum,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        await Get_All_Classes_API(context).Get_All_Classes();
        Get.back();
        Get.find<ClassMgmtController>().selectIndex("admin", "");
        Get.find<ClassMgmtController>().selectIndex("gradediag", "");
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
    } finally {
      Get.back();
    }
  }
}
