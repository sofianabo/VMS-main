import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Vaccines_APIs/Get_All_Vaccines_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Functions/Show_Vaccines_By_Id.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Students_Vaccines_Model.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Get_Students_Vacciness_API {
  final BuildContext context;
  final Dio dio = Dio();

  Get_Students_Vacciness_API(this.context);

  Future<void> Get_Students_Vacciness(
      {int? studentId, required int? index_of_student}) async {
    final vaccinesController = Get.find<Vaccines_Controller>();

    vaccinesController.SetIsLoading(true);

    try {
      String apiUrl = "${hostPort}${getStudentVaccines}";
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      await Get_Vaccines_API(context).Get_Vaccines(cancelToken: cancelToken);

      var response = await dio.post(
        apiUrl,
        data: {"id": studentId},
        cancelToken: cancelToken,
        options: getDioOptions(),
      );

      Get.back();
      if (response.statusCode == 200) {
        Students_Vaccines_Model students_vaccines_model =
            Students_Vaccines_Model.fromJson(response.data);
        vaccinesController.setIllnessSelected(students_vaccines_model);
        Show_Vaccines_By_Id_Funcation(context, studentId, index_of_student);
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
      vaccinesController.SetIsLoading(false);
    }
  }
}
