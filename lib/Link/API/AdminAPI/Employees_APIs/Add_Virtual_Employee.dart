import 'package:dio/dio.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_Virtual_Employee.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Virtual_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:get/get.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Add_Virtual_Employee_API {
  static Dio dio = Dio();

  static Future<dynamic> Add_Virtual_Employee({
    required userName,
    required password,
    required roll,
  }) async {


    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    String myURI = "$hostPort$addVirtualUser";

    try {

      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: {
          'userName': userName,
          'password': password,
          'roll': roll,
        },
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
      Get_Virtual_Employee_API.Get_Virtual_Employee();
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
    }finally{
      Get.back();
      Get.back();
    }
    return true;
  }
}
