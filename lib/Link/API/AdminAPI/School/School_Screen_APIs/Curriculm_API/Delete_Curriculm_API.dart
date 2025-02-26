import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Delete_Curriculm_API {
  BuildContext context;
  Delete_Curriculm_API(this.context);
  Dio dio = Dio();

  Delete_Curriculm(
      {
        required cid,
      }
      ) async {

    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "$hostPort$deleteCurriculum";

      var response = await dio.post(
        cancelToken: cancelToken,
          myurl,
          data: {
          "id":cid
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
      Get.back();
        await Get_All_Curriculm_API(context).Get_All_Curriculm();

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
