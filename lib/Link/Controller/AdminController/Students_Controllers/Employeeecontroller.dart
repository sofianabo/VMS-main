import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/IncreaseEmpolyeeAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/IncreaseTeacherAttendenceModel.dart';


class EmployeeController extends GetxController {
  bool Isloading = true;
  bool Isuploaded = false;



  List<Employee>? employees;
  List<Teacher>? teachers;
  var Employees = <Map<String, dynamic>>[].obs;

  setData(IncreaseEmpolyeeAttendenceModel employee) {
    employees = employee.employee;
    Employees.clear();
    for (var emp in employees!) {
      Employees.add({
        'employeeId': emp.id!,
        'status': 'Present',
        'cause': null,
        'name': emp.fullName!,
        'imgid': emp.imageId??"",
      });
    }

    if(employees!.isEmpty){
      setIsIsuploaded(true);
    }
    setIsload(false);
    update();
  }

  setTeacherData(IncreaseTeacherAttendenceModel teach) {
    teachers = teach.teacher;
    Employees.clear();

    for (var t in teachers!) {
        Employees.add({
          'employeeId': t.id!,
          'status': 'Present',
          'cause': null,
          'name': t.fullName!,
          'imgid': t.imageId ?? "",
        });
    }
    if(teachers!.isEmpty){
      setIsIsuploaded(true);
    }
    setIsload(false);
    update();
  }


  setIsload(bool value) {
    Isloading = value;
    update();
  }

  setIsIsuploaded(bool value) {
    Isuploaded = value;
    update();
  }

  var allHolidayChecked = false.obs;


  void updateStatus(int index, String newStatus, String? cause) {
    Employees[index]['cause'] = cause;
    Employees[index]['status'] = newStatus;
    Employees.refresh();
    checkAllHolidayStatus();
  }


  void setAllAsHoliday(bool checked, String? holiday) {
    allHolidayChecked.value = checked;
    for (var item in Employees) {
      item['status'] = checked ? 'Holiday' : 'Present';
      item['cause'] = checked ? holiday : null;
    }

    Employees.refresh();
  }

  void checkAllHolidayStatus() {
    allHolidayChecked.value =
        Employees.every((item) => item['status'] == 'Holiday');
  }
}
