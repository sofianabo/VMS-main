import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Get_All_Division.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Edit_Division_API {
  BuildContext context;
  Edit_Division_API(this.context);
  Dio dio = Dio();

  Edit_Division(
  {
    gradeId,
    name,
    enName,
    meeturl
}

      ) async {


    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "$hostPort$updateDivision";
      var response = await dio.post(
        cancelToken: cancelToken,
          myurl,
             data: {
             'id':'$gradeId',
             'name':'$name',
             'enName':'$enName',
             'meetUrl':'$meeturl',
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        await Get_All_Division_API(context).Get_All_Division(sessionId: Get.find<All_Screen_Sessions_Controller>().sessionId);
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
