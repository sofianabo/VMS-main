import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';


class Renamed {
  Renamed(this.context);
  BuildContext context;
  Dio dio = Dio();
  add(


      ) async {
    String myURI = "$hostPort$addFullEmployee";
    try {
      var response = await dio.post(myURI,
          data: {

          },
          options: getDioOptions());

      if (response.statusCode == 200) {

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
