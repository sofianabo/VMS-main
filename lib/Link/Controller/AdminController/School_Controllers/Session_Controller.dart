import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';

class SessionController extends GetxController {
  var Sessionss = <Map<String, dynamic>>[].obs;

  List<Sessions>? sessions;

  bool isLoading = true;

  setData(AllSessionModel sessions) {
    sessions = sessions;
    Sessionss.clear();
    setIsLoading(false);
    for (var stu in sessions.sessions!) {
      Sessionss.add({
        'id': stu.id,
        'name': stu.year,
        'status': stu.status,
        'startDate': stu.startDate,
        'endDate': stu.endDate,
        'hasStudents': stu.hasStudent == 1 ? true : false,
      });
    }
    update();
  }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }

  TextEditingController sessionController = TextEditingController();
  var borderColor = const Color(0xffD9D9D9).obs; // Reactive border color

  void updateStatus(int index, String newStatus) {
    Sessionss[index]['status'] = newStatus;
    update();
  }

  var currentYear = 0.obs;

  void updateYear(String year) {
    int? parsedYear = int.tryParse(year);
    if (parsedYear != null &&
        year.length == 4 &&
        parsedYear >= 2024 &&
        parsedYear < 2099) {
      currentYear.value = parsedYear + 1;
    }
  }

  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  void SelectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      startDate.value = picked;
    }
  }

  void SelectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      endDate.value = picked;
    }
  }

  Rx<DateTime?> get selectStartDateindex => startDate;
  Rx<DateTime?> get selectEndDateindex => endDate;
}
