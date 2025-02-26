import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/RequestsAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Rejectenrollrequestapi {
  BuildContext context;
  Rejectenrollrequestapi(this.context);
  Dio dio = Dio();

  Rejectenrollrequest(int id) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "${global.hostPort}${global.rejectrequest}/$id";
      var response = await dio.get(
          cancelToken: cancelToken, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        GetAllRequestsapi(context).GetAllRequests();
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
