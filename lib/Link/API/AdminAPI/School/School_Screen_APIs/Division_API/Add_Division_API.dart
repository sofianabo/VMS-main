import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Get_All_Division.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Add_Division_API {
  BuildContext context;
  Add_Division_API(this.context);
  Dio dio = Dio();

  Add_Division(
  {
    classId,
    enName,
    name,
    meetUrl
}
      ) async {

    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      String myurl = "$hostPort$createDivision";
      var response = await dio.post(
        cancelToken: cancelToken,
          myurl,
          data: {
             'classId':'$classId',
             'enName':'$enName',
             'name':'$name',
             'meetUrl':'$meetUrl',
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        await Get_All_Division_API(context).Get_All_Division();
        Get.back();
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
    }finally{
     Get.back();
    }
  }
}
