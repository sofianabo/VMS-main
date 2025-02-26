import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/RequestsModel.dart';
import '../../API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class GetAllRequestsapi {
  Requestscontroller c = Get.find<Requestscontroller>();
  BuildContext context;
  GetAllRequestsapi(this.context);
  Dio dio = Dio();

  GetAllRequests() async {
    try {
      c.SetIsloading(true);
      String myurl = "$hostPort$getRequests";
      var response = await dio.get(myurl, options: getDioOptions());

      if (response.statusCode == 200) {
        AllRequestsModel requests = AllRequestsModel.fromJson(response.data);
        AllClassModel classesModel = await Getallclassapi.getAllClasses();
        c.setAllClassDialog(classesModel);
        c.setAllRequests(requests);
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
