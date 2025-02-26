import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/School_Data_API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';


class Update_School_Data_API {
  Update_School_Data_API(this.context);
  BuildContext context;
  Dio dio = Dio();
  Update_School_Data(
      ) async {
    String myURI = "$hostPort$updatSchoolData";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      final controller = Get.find<SchoolInfoController>();
      var response = await dio.post(myURI,
          data: {
            "countryId":3,
            "schoolName":controller.School_Name.text,
            "licenseNumber":controller.License_Number.text,
            "congregationNumber":controller.Congregation_number.text,
            "previousName":controller.Previous_name.text,
            "address":controller.Address.text,
            "village":controller.Village.text,
            "township":controller.Town_Chip.text,
            "region":controller.Region.text,
            "phone":controller.Phone.text,
            "fax":controller.Fax.text,
            "email":controller.Email.text,
            "creatYear":controller.Creation_Year.text,
            "workBeginYear":controller.Work_Begin_Year.text,
            // "workType":"",
            "clinicName":controller.Clinic_Name.text,
            "internetConnection":controller.Internet_Connection.value,
            "governmentConnection":controller.Government_Connection.value,
            "industrialSection":controller.Industrial_Section.value,
            "jointBuilding":controller.Joint_Building.value,
            "martyrsSons":controller.Martyrs_Sons.value,
            "outstandingSchool":controller.Outstanding_School.value,
            "takenOverSchool":controller.Taken_OverSchool.value,
            "reassignmentTeachers":controller.Reassignment_Teachers.value
          },


          options: getDioOptions());
      if (response.statusCode == 200) {
        await School_Data_API(context).School_Data();
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
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
    }
  }
}
