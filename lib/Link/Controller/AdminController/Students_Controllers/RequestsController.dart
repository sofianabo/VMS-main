import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/RequestsModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Requestscontroller extends GetxController {
  List<Registration> registration = [], filteredregistration = [];
  String searchQuery = "",
      statusindex = "",
      classIndex = "",
      divisionIndex = "";
  Rx<DateTime?> requestDate = Rx<DateTime?>(null);
  String? filterName = '';
  String? filterDate = '';
  List<String> statusList = ['Rejected'.tr, 'Pending'.tr, 'Partially'.tr];
  List<String> classlist = [],
      divisionlist = Get.find<Dropdowndivisioncontroller>().division;
  List<Classes> allClass = [];
  bool isLoading = true;

  clearDivision() {
    divisionIndex = "";
    divisionlist.clear();
    update();
  }

  SetIsloading(bool value) {
    isLoading = value;
    update();
  }

  void clearName() {
    filterName = "";
    searchByName("", statusindex, filterDate);
    update();
  }

  void searchByName(String? nameQuery, String? status, String? date) {
    filterName = nameQuery;

    List<Registration> tempFilteredList = List.from(registration);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final stuname = cur.student!.name?.toLowerCase() ?? '';
        final graname = cur.guardian!.name?.toLowerCase() ?? '';
        final graemail = cur.guardian!.email?.toLowerCase() ?? '';
        final grphone = cur.guardian!.phone?.toLowerCase() ?? '';
        final grnational = cur.guardian!.nationalId?.toLowerCase() ?? '';
        return stuname.contains(nameQuery.toLowerCase()) ||
            graname.contains(nameQuery.toLowerCase()) ||
            graemail.contains(nameQuery.toLowerCase()) ||
            grphone.contains(nameQuery.toLowerCase()) ||
            grnational.contains(nameQuery.toLowerCase());
      }).toList();
    }

    if (status != null && status.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.type == status;
      }).toList();
    }

    if (date != null && date.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.date == date;
      }).toList();
    }

    filteredregistration = tempFilteredList;
    update();
  }

  void setAllRequests(AllRequestsModel req) {
    registration = req.registration!;
    filteredregistration = List.from(req.registration!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), statusindex, filterDate);
    }

    if (statusindex.isNotEmpty) {
      filteredregistration = filteredregistration.where((emp) {
        return emp.type! == statusindex;
      }).toList();
    }
    if (filterDate!.isNotEmpty) {
      filteredregistration = filteredregistration.where((emp) {
        return emp.date == filterDate;
      }).toList();
    }

    isLoading = false;
    update();
  }

  setdate(DateTime date) {
    filterDate = "${date.year}-${date.month}-${date.day}";
    requestDate.value = date;
    searchByName(filterName, statusindex, filterDate);
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'status':
        statusindex = index ?? "";
        break;
      case 'class':
        classIndex = index ?? "";
        break;
      case 'division':
        divisionIndex = index ?? "";
        break;
    }
    if (type == "status") {
      searchByName(filterName, statusindex, filterDate);
    }
    if (type == "class") {
      Get.find<Dropdowndivisioncontroller>()
          .setIsDisiabled(index == "" ? true : false);
    }
    update();
  }

  void resetFilters() {
    searchQuery = statusindex = "";
    requestDate.value = null;
    filteredregistration = List.from(registration);
    update();
  }

  void setAllClassDialog(AllClassModel clas) {
    classlist = prefs!.getString(languageKey) == 'ar'
        ? clas.classes!.map((c) => c.name!).toList()
        : clas.classes!.map((c) => c.enName!).toList();
    update();
  }

  void setAllDivisionDialog(AllDivisionModel division) {
    prefs!.getString(languageKey) == 'ar'
        ? divisionlist = division.division!.map((d) => d.name!).toList()
        : divisionlist = division.division!.map((d) => d.enName!).toList();
    update();
  }

  void selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: requestDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    setdate(picked!);
  }

  void removeDate() {
    requestDate.value = null;
    filterDate = "";
    searchByName(filterName, statusindex, "");
    update();
  }

  String get selectedStatusIndex => statusindex;
  String get selectedClassIndex => classIndex;
  String get selectedDivisionIndex => divisionIndex;
  Rx<DateTime?> get selectDateindex => requestDate;
}
