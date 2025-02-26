import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownPenaltyController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllPenaltyModel.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Get_All_Benality_API {
  Dropdownpenaltycontroller c = Get.find<Dropdownpenaltycontroller>();
  BuildContext context;
  Get_All_Benality_API(this.context);
  Dio dio = Dio();

  Get_All_Benality() async {
    try {
      c.setIsLoading(true);
      String myurl = "$hostPort$allPenalty";
      var response = await dio.get(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllPenaltyModel penalty = AllPenaltyModel.fromJson(response.data);
        c.setPenalty(penalty);
        return penalty;
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
