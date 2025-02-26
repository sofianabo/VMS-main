import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Get_All_E_Book.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Add_E_Book_API {
  BuildContext context;
  Add_E_Book_API(this.context);
  Dio dio = Dio();

  Add_E_Book(
  {
    name,
    file,
    enName,
}
      ) async {

    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {

      FormData formData = FormData.fromMap({
        'name':'$name',
        'enName':'$enName',
      });

      if (file != null) {
        formData.files.add(MapEntry(
          "file",
          MultipartFile.fromBytes(file, filename: "ElectronicFile.pdf"),
        ));
      }

      String myurl = "$hostPort$addBook";

      var response = await dio.post(
        data: formData,
        cancelToken: cancelToken,
          myurl,
          options: getDioOptions());

      if (response.statusCode == 200) {
        gets.Get.back();
        gets.Get.back();
        await Get_All_E_Book_API(context).Get_All_E_Book();
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
