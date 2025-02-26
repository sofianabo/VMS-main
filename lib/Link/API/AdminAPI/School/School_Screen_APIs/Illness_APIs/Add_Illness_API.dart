import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Illness_APIs/Get_All_Illness_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Add_Illness_API {
  BuildContext context;
  Add_Illness_API(this.context);
  Dio dio = Dio();

  Add_Illness({
    name,
    enName,
    chronic,
  }) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      FormData formData = FormData.fromMap({
        'name': '$name',
        'enName': '$enName',
        'chronic': '${chronic == true ? 1 : 0}',
      });

      String myurl = "${hostPort}${addIllness}";

      var response = await dio.post(
          data: formData,
          cancelToken: cancelToken,
          myurl,
          options: getDioOptions());

      if (response.statusCode == 200) {
        gets.Get.back();
        gets.Get.back();
        await Get_Illness_API(context).Get_Illness();
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
