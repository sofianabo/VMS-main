import 'package:dio/dio.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/All_Virtual_Employee_Controller.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Virtual_Employee_Model.dart';

class Get_Virtual_Employee_API {
  static Dio dio = Dio();

  static Future<dynamic> Get_Virtual_Employee() async {

   final controller = Get.find<All_Virtual_Employee_Controller>();
    String myURI = "$hostPort$getVirtualUser";
   controller.SetIsLoading(true);
    try {
      var response = await dio.get(
        myURI,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        Virtual_Employee_Model virtualEmployeeModel = Virtual_Employee_Model.fromJson(response.data);
        controller.setData(virtualEmployeeModel);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioException && e.type == DioExceptionType.cancel) {
        print("Request canceled");
      } else if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
    return true;
  }
}
