import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownSessionController.dart.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';

class Getsessionapi {
  Dropdownsessioncontroller c = Get.find<Dropdownsessioncontroller>();
  BuildContext context;
  Getsessionapi(this.context);
  Dio dio = Dio();

  Getsession() async {
    try {
      String myurl = "$hostPort$getSession";
      var response = await dio.get(myurl,
options: getDioOptions());
      if (response.statusCode == 200) {
        AllSessionModel session = AllSessionModel.fromJson(response.data);
        c.setSession(session);
        return session;
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
