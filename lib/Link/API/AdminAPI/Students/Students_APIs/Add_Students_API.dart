import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/GetAllStudentAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Add_Student_API {
  Add_Student_API(this.context);
  BuildContext context;

  static Add_Student({
    locationId,
    firstName,
    lastName,
    gender,
    birthDate,
    placeOfBirth,
    religion,
    mobileNumber,
    bloodType,
    fatherName,
    fatherPhone,
    motherName,
    currentAdress,
    familystatus,
    guardianId,
    userName,
    password,
    classid,
    divisionId,
    fatherWork,
    motherPhone,
    motherWork,
    nationalNumber,
    localID,
    lastSchoolDetail,
    note,
    specialNeeds,
    martyrSon,
    FatherPassport,
    MotherPassport,
    SonPassport,
    UserID,
    Certefecate,
    Academic_sequence,
    FamilyNotbook,
    file,
    illness,
    vaccine,
    Fee_Discount,
  }) async {
    Dio dio = Dio();
    String myURI = "${hostPort}${addStudentInfo}";

    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);

      Map<String, dynamic> formDataMap = {
        "locationId": locationId,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "birthDate": birthDate,
        "placeOfBirth": placeOfBirth,
        "religion": religion,
        "mobileNumber": mobileNumber,
        "bloodType": bloodType,
        "fatherName": fatherName,
        "fatherPhone": fatherPhone,
        "motherName": motherName,
        "currentAdress": currentAdress,
        "familystatus": familystatus,
        "guardianId": guardianId,
        "userName": userName,
        "password": password,
        "classid": classid,
        "divisionId": divisionId,
        "fatherWork": fatherWork,
        "motherPhone": motherPhone,
        "motherWork": motherWork,
        "nationalNumber": nationalNumber,
        "localID": localID,
        "lastSchoolDetail": lastSchoolDetail,
        "note": note,
        "specialNeeds": specialNeeds == true ? 1 : 0,
        "martyrSon": martyrSon == true ? 1 : 0,
        "feeDiscount": Fee_Discount,
      };

      List<Map<String, dynamic>> files = [];

      if (FatherPassport != null) {
        files.add({
          "name": "FatherPassport",
          "file": MultipartFile.fromBytes(
            FatherPassport,
            filename: 'FatherPassport',
          )
        });
      }

      if (file != null) {
        formDataMap.addAll({
          "file": MultipartFile.fromBytes(
            file,
            filename: '$firstName ${lastName}Student Profile Image',
          )
        });
      }

      if (illness != null) {
        formDataMap.addAll({"illness": illness});
      }

      if (vaccine != null) {
        formDataMap.addAll({"vaccines": vaccine});
      }

      if (MotherPassport != null) {
        files.add({
          "name": "MotherPassport",
          "file": MultipartFile.fromBytes(
            MotherPassport,
            filename: 'MotherPassport',
          )
        });
      }

      if (SonPassport != null) {
        files.add({
          "name": "SonPassport",
          "file": MultipartFile.fromBytes(
            SonPassport,
            filename: 'SonPassport',
          )
        });
      }

      if (UserID != null) {
        files.add({
          "name": "UserID",
          "file": MultipartFile.fromBytes(
            UserID,
            filename: 'UserID',
          )
        });
      }

      if (Certefecate != null) {
        files.add({
          "name": "Certificate",
          "file": MultipartFile.fromBytes(
            Certefecate,
            filename: 'Certificate',
          )
        });
      }

      if (Academic_sequence != null) {
        files.add({
          "name": "AcademicSequence",
          "file": MultipartFile.fromBytes(
            Academic_sequence,
            filename: 'AcademicSequence',
          )
        });
      }

      if (FamilyNotbook != null) {
        files.add({
          "name": "Family Notebook",
          "file": MultipartFile.fromBytes(
            FamilyNotbook,
            filename: 'Family Notebook',
          )
        });
      }

      formDataMap.addAll({
        "documant": files,
      });

      FormData formData = FormData.fromMap(formDataMap);

      var response = await dio.post(
        myURI,
        data: formData,
        cancelToken: cancelToken,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        gets.Get.back();
        Getallstudentapi.Getallstudent();
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    } finally {
      gets.Get.back();
    }
  }
}
