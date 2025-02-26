import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class DeleteEmployee {
  static Dio dio = Dio();

  static Future<dynamic> DeleteEmployeeByID({
    required String employeeID,
  }) async {
    String myURI = "$hostPort$deleteEmployee";
    CancelToken cancelToken = CancelToken();
    try {
    Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: {
          'id':employeeID
        },
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
       await Get_All_Employee_API.Get_All_Employee();

        return response.statusCode;
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
    }finally{
      Get.back();
      Get.back();
    }
    return true;
  }

}
