import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/PenaltyController.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Labrary_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllPenaltyModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Vaccines_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Labrary_Model.dart';

class Getpenaltyapi {
  BuildContext context;
  Getpenaltyapi(this.context);
  Dio dio = Dio();
  Getpenalty() async {
   final controller = Get.find<Penaltycontroller>();

    try {
     controller.setIsLoading(true);
      String myurl = "${hostPort}${allPenalty}";
      var response = await dio.get(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
       AllPenaltyModel pen = AllPenaltyModel.fromJson(response.data);
       controller.setData(pen);
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
