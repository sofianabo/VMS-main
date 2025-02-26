import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/oneStudentAttendenceController.dart';
import 'package:vms_school/Link/Model/AdminModel/OneStudentAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/PenaltiesAndRewardsStudentModel.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Getpenaltiesandrewardsapi {
  BuildContext context;
  final Penaltiesandrewardscontroller c =
      Get.find<Penaltiesandrewardscontroller>();
  Getpenaltiesandrewardsapi(this.context);
  Dio dio = Dio();

  Getpenaltiesandrewards(int id) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "$hostPort$getStudentsPenalty";
      var response = await dio.post(myurl,
          cancelToken: cancelToken,
          data: {"id": id},
          options: getDioOptions());
      if (response.statusCode == 200) {
        PenaltiesAndRewardsStudentModel st =
            PenaltiesAndRewardsStudentModel.fromJson(response.data);
        c.setPenaltyAndRewards(st);
        return st;
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
    } finally {
      Get.back();
    }
  }
}
