import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class EditEmployeeApi {
  static Dio dio = Dio();
  static Future<dynamic> EditEmployee({
    required String employeeId,
    required String First_Name,
    required String Last_Name,
    required String Father_Name,
    required String Mother_Name,
    required String Phone_Numper,
    required String Emergency_Number,
    required String Address,
    required String Current_Address,
    required String Birth_Date,
    required String Join_Date,
    required String Gender,
    required String Family_State,
    Uint8List? selectedImage,
    String? Salary,
    String? Facebook_URL,
    String? X_Platform_URL,
    String? Linkedin_URL,
    String? Instagram_URL,
    String? Bank_Account_Title,
    String? Bank_Name,
    String? Bank_Branch_Name,
    String? Bank_Account_Number,
    String? IFSC_Code,
    String? Career_History,
    String? Qualification,
    String? Experience,
    String? Note,
  }) async {
    CancelToken cancelToken = CancelToken();
    String myURI = "$hostPort$updateEmployee";
    try {
      Loading_Dialog(cancelToken: cancelToken);
      FormData formData = FormData.fromMap({
        "employeeId": employeeId,
        "firstName": First_Name,
        "lastName": Last_Name,
        "fatherName": Father_Name,
        "motherName": Mother_Name,
        "gender": Gender,
        "birthDate": Birth_Date,
        "joinDate": Join_Date,
        "phone": Phone_Numper,
        "emergencyNumber": Emergency_Number,
        "familystatus": Family_State,
        "currentAddress": Current_Address,
        "address": Address,
        "qualification": Qualification,
        "experience": Experience,
        "note": Note,
        "salary": Salary,
        "bankAccountTitle": Bank_Account_Title,
        "bankName": Bank_Name,
        "bankBranchName": Bank_Branch_Name,
        "bankAccountNumber": Bank_Account_Number,
        "IFSCCode": IFSC_Code,
        "facebookUrl": Facebook_URL,
        "twitterUrl": X_Platform_URL,
        "lenkedinUrl": Linkedin_URL,
        "instagramUrl": Instagram_URL,
        "careerHistory": Career_History,
        'ownData': true
      });

      if (selectedImage != null) {
        formData.files.add(MapEntry(
          "file",
          MultipartFile.fromBytes(selectedImage,
              filename: employeeId + "ProfileImage"),
        ));
      }

      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: formData,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        await Get_All_Employee_API.Get_All_Employee();
        gets.Get.find<Allempolyeecontroller>().SetDefualtValue();
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
    } finally {
      gets.Get.back();
      gets.Get.back();
    }
    return null;
  }
}
