import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/oneEmployeeAttendenceModel.dart';

class Oneemployeeattendencecontroller extends GetxController {
  late BuildContext context;
  List<EmployeeAttendance> employeeAtt = [];
  bool isLoading = true;

  void setEmployeeAttendence(oneEmployeeAttendenceModel model) {
    employeeAtt = model.employeeAttendance!;
    setIsLoading(false);
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }
}
 