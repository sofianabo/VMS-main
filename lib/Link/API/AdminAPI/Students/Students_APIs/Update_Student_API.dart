import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/GetAllStudentAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Update_Student_API {
  Update_Student_API(this.context);
  BuildContext context;

  static Update_Student({
    studentID,
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
    FatherPassport_FileID,
    MotherPassport_FileID,
    SonPassport_FileID,
    UserID_FileID,
    Certefecate_FileID,
    Academic_sequence_FileID,
    FamilyNotbook_FileID,
    file,
    Fee_Discount,
    Ispend,
  }) async {
    Dio dio = Dio();
    String myURI = "${hostPort}${updateStudent}";

    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);

      FormData formData = FormData();

      formData.fields.addAll([
        MapEntry("id", studentID.toString()),
        MapEntry("locationId", locationId.toString()),
        MapEntry("firstName", firstName),
        MapEntry("lastName", lastName),
        MapEntry("gender", gender),
        MapEntry("birthDate", birthDate.toString()),
        MapEntry("placeOfBirth", placeOfBirth),
        MapEntry("religion", religion),
        MapEntry("mobileNumber", mobileNumber),
        MapEntry("bloodType", bloodType),
        MapEntry("fatherName", fatherName),
        MapEntry("fatherPhone", fatherPhone),
        MapEntry("motherName", motherName),
        MapEntry("currentAdress", currentAdress),
        MapEntry("familystatus", familystatus),
        MapEntry("classid", classid.toString()),
        MapEntry("divisionId", divisionId.toString()),
        MapEntry("fatherWork", fatherWork),
        MapEntry("motherPhone", motherPhone),
        MapEntry("motherWork", motherWork),
        MapEntry("nationalNumber", nationalNumber),
        MapEntry("localID", localID),
        MapEntry("lastSchoolDetail", lastSchoolDetail),
        MapEntry("note", note),
        MapEntry("specialNeeds", specialNeeds == true ? "1" : "0"),
        MapEntry("martyrSon", martyrSon == true ? "1" : "0"),
        MapEntry("pend", Ispend == true ? "1" : "0"),
        MapEntry("feeDiscount", Fee_Discount.toString()),
      ]);

      if (password != null &&
          password.toString().trim().isNotEmpty &&
          password.toString().length >= 8) {
        formData.fields.add(MapEntry("password", password));
      }

      if (file != null) {
        formData.files.add(MapEntry(
          "file",
          MultipartFile.fromBytes(
            file,
            filename: '$firstName"_"$lastName"_"Student_Profile_Image',
          ),
        ));
      }

      List<Map<String, dynamic>> files = [
        if (FatherPassport != null)
          {
            "id": FatherPassport_FileID,
            "name": "FatherPassport",
            "file": MultipartFile.fromBytes(
              FatherPassport,
              filename: 'file.pdf',
            ),
          },
        if (MotherPassport != null)
          {
            "id": MotherPassport_FileID,
            "name": "MotherPassport",
            "file": MultipartFile.fromBytes(
              MotherPassport,
              filename: 'file.jpg',
            ),
          },
        if (SonPassport != null)
          {
            "id": SonPassport_FileID,
            "name": "SonPassport",
            "file": MultipartFile.fromBytes(
              SonPassport,
              filename: 'SonPassport',
            ),
          },
        if (UserID != null)
          {
            "id": UserID_FileID,
            "name": "UserID",
            "file": MultipartFile.fromBytes(
              UserID,
              filename: 'UserID',
            ),
          },
        if (Certefecate != null)
          {
            "id": Certefecate_FileID,
            "name": "Certificate",
            "file": MultipartFile.fromBytes(
              Certefecate,
              filename: 'Certificate',
            ),
          },
        if (Academic_sequence != null)
          {
            "id": Academic_sequence_FileID,
            "name": "AcademicSequence",
            "file": MultipartFile.fromBytes(
              Academic_sequence,
              filename: 'AcademicSequence',
            ),
          },
        if (FamilyNotbook != null)
          {
            "id": FamilyNotbook_FileID,
            "name": "Family Notebook",
            "file": MultipartFile.fromBytes(
              FamilyNotbook,
              filename: 'Family Notebook',
            ),
          },
      ];

      for (int i = 0; i < files.length; i++) {
        final fileEntry = files[i];
        formData.fields
            .add(MapEntry("documant[$i][id]", fileEntry["id"].toString()));
        formData.fields.add(MapEntry("documant[$i][name]", fileEntry["name"]));
        formData.files.add(MapEntry(
          "documant[$i][file]",
          fileEntry["file"] as MultipartFile,
        ));
      }

      var response = await dio.post(
        myURI,
        data: formData,
        cancelToken: cancelToken,
        options: getDioOptions(),
      );

      // التعامل مع الاستجابة
      if (response.statusCode == 200) {
        gets.Get.back();
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
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
