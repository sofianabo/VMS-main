import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/School_Data_Model.dart';

class SchoolInfoController extends GetxController {
  bool isLoading = true;

  var Outstanding_School = false.obs;
  var Taken_OverSchool = false.obs;
  var Reassignment_Teachers = false.obs;
  var Martyrs_Sons = false.obs;
  var Internet_Connection = false.obs;
  var Government_Connection = false.obs;
  var Joint_Building = false.obs;
  var Industrial_Section = false.obs;


  TextEditingController School_Name = TextEditingController();
  TextEditingController License_Number = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController Village = TextEditingController();
  TextEditingController Region = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Creation_Year = TextEditingController();
  TextEditingController Clinic_Name = TextEditingController();
  TextEditingController Congregation_number = TextEditingController();
  TextEditingController Previous_name = TextEditingController();
  TextEditingController Town_Chip = TextEditingController();
  TextEditingController Fax = TextEditingController();
  TextEditingController Work_Begin_Year = TextEditingController();

  String CountryIndex = "";
  String Work_TypeIndex = "";

  List<Map<String, dynamic>> SchoolInfo = [];

  void setData(Data? datas) {
    if (datas!.schoolName == null) {
      SchoolInfo.clear();
      Map<String, dynamic> newSchoolInfo = {
        "School_Name": "",
        "License_Number":"",
        "Address":"",
        "Village":"",
        "Region":"",
        "Phone":"",
        "Email":"",
        "Creation_Year":"",
        "Clinic_Name":"",
        "Congregation_number":"",
        "Previous_name":"",
        "Town_Chip":"",
        "Fax":"",
        "Work_Begin_Year": "",
        "Country":""     ,
        "Work_Type":""      ,
        "Outstanding_School":"",
        "Taken_OverSchool":"",
        "Reassignment_Teachers":"",
        "Martyrs_Sons":"",
        "Internet_Connection":"",
        "Government_Connection":"",
        "Joint_Building":"",
        "Industrial_Section":"",
      };
      SchoolInfo.add(newSchoolInfo);
    } else {
      School_Name.text = datas.schoolName!;
      License_Number.text = datas.licenseNumber!;
      Address.text = datas.address!;
      Village.text = datas.village!;
      Region.text = datas.region!;
      Phone.text = datas.phone!;
      Email.text = datas.email!;
      Creation_Year.text = datas.creatYear.toString();
      Clinic_Name.text = datas.clinicName ?? "";
      Congregation_number.text = datas.congregationNumber!;
      Previous_name.text = datas.previousName ?? "";
      Town_Chip.text = datas.township!;
      Fax.text = datas.fax ?? "";
      Work_Begin_Year.text = datas.workBeginYear.toString();
      CountryIndex = datas.country!.enName!;
      Work_TypeIndex = datas.workType!;
      Outstanding_School.value = datas.outstandingSchool == 1 ? true : false;
      Taken_OverSchool.value = datas.takenOverSchool == 1 ? true : false;
      Reassignment_Teachers.value =
      datas.reassignmentTeachers == 1 ? true : false;
      Martyrs_Sons.value = datas.martyrsSons == 1 ? true : false;
      Internet_Connection.value = datas.internetConnection == 1 ? true : false;
      Government_Connection.value =
      datas.governmentConnection == 1 ? true : false;
      Joint_Building.value = datas.jointBuilding == 1 ? true : false;
      Industrial_Section.value = datas.industrialSection == 1 ? true : false;

      Map<String, dynamic> newSchoolInfo = {
        "School_Name": School_Name.text,
        "License_Number": License_Number.text,
        "Address": Address.text,
        "Village": Village.text,
        "Region": Region.text,
        "Phone": Phone.text,
        "Email": Email.text,
        "Creation_Year": int.parse(Creation_Year.text),
        "Clinic_Name": Clinic_Name.text,
        "Congregation_number": Congregation_number.text,
        "Previous_name": Previous_name.text,
        "Town_Chip": Town_Chip.text,
        "Fax": Fax.text,
        "Work_Begin_Year": int.parse(Work_Begin_Year.text),
        "Country": CountryIndex,
        "Work_Type": Work_TypeIndex,
        "Outstanding_School": Outstanding_School.value,
        "Taken_OverSchool": Taken_OverSchool.value,
        "Reassignment_Teachers": Reassignment_Teachers.value,
        "Martyrs_Sons": Martyrs_Sons.value,
        "Internet_Connection": Internet_Connection.value,
        "Government_Connection": Government_Connection.value,
        "Joint_Building": Joint_Building.value,
        "Industrial_Section": Industrial_Section.value,
      };
      SchoolInfo.clear();
      SchoolInfo.add(newSchoolInfo);
    }
    setIsLoading(false);
    update();
  }


  List<String> listCountry = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];
  List<String> listWork_Type = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];



  void selectIndex(String type, String? index) {
    switch (type) {
      case 'Country':
        CountryIndex = index ?? "";
        break;
      case 'Work_Type':
        Work_TypeIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'Country':
        listCountry = options;
        break;
      case 'Work_Type':
        listWork_Type = options;
        break;
    }
    update();
  }

  String get selectCountryIndex => CountryIndex;

  String get selectWork_TypeIndex => Work_TypeIndex;

  void setIsLoading(bool value) {
    isLoading = value;
    update();
  }
}
