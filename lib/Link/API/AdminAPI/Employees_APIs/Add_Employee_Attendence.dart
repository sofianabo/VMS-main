import 'package:dio/dio.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:get/get.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Add_Employee_Attendence_API {
  static Dio dio = Dio();

  static Future<dynamic> Add_Employee_Attendence({
    required employees,
  }) async {

    final controller = Get.find<EmployeeController>();
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    String myURI = "$hostPort$addEmployeeAttendance";

    try {

      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: {'attendance': employees},
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        controller.setIsIsuploaded(true);
        return response.statusCode;
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
    }
    return true;
  }
}
