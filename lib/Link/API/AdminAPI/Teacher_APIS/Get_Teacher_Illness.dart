import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Illness_APIs/Get_All_Illness_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Functions/Show_Emp_Illnes_By_Id.dart';
import 'package:vms_school/Link/Functions/Show_Illnes_By_Id.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Students_Illness.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Get_Teacher_Illness_API {
  final BuildContext context;
  final Dio dio = Dio();

  Get_Teacher_Illness_API(this.context);

  Future<void> Get_Teacher_Illness(
      {int? teachId, int? index_of_Emp, required bool IsTeacher}) async {
    final illnessController = Get.find<Illness_Controller>();

    illnessController.SetIsLoading(true);

    try {
      String apiUrl = "${hostPort}${getEmployeeIll}";
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      await Get_Illness_API(context).Get_Illness(cancelToken: cancelToken);

      var response = await dio.post(
        apiUrl,
        data: {"employeeId": teachId},
        cancelToken: cancelToken,
        options: getDioOptions(),
      );

      Get.back();
      if (response.statusCode == 200) {
        Students_Illness studentsIllness =
            Students_Illness.fromJson(response.data);
        illnessController.setIllnessSelected(studentsIllness);
        Show_Teacher_Illnes_By_Id(
            context: context,
            id: teachId,
            index_of_Emp: index_of_Emp,
            IsTeacher: IsTeacher);
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
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    } finally {
      illnessController.SetIsLoading(false);
    }
  }
}
