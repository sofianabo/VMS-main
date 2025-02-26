import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Model/AdminModel/OneTeacherModel.dart';
import 'package:vms_school/Link/Model/AdminModel/One_Employee_Model.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Edit_Employee.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/EditTeacherInfo.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class GetteacherbyidAPI {
  static Dio dio = Dio();

  static Future<dynamic> Getteacherbyid({
    required String TeacherId,
    required BuildContext context,
    required int index,
  }) async {
    final controller = Get.find<Allteachercontroller>();
    controller.SetDefualtValue();
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);

    String myURI = "$hostPort$getTeacherById";

    try {
      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: {'TeacherId': TeacherId},
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        Oneteachermodel oneTeacher = Oneteachermodel.fromJson(response.data);
        controller.setOneTeacher(oneTeacher);
        Get.back();
        EditTeacherDialog(context, index, TeacherId);
        return response.statusCode;
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      print(e);
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
