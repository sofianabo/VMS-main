import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';

class Dropdowngradecontroller extends GetxController {
  List<Map<String, dynamic>> grades = [];
  AllGradesModel? gradess;
  bool isLoading = true;

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }
  var gradeId;
  void setgradeId(id) {
    gradeId = id;
    update();
  }
  void setGrades(AllGradesModel grade) {
    grades.clear();
    gradess = grade;
    List<String> gradeNames = [];
    if (grade.grades != null) {
      for (var g in grade.grades!) {
        grades.add({
          'id': g.id,
          'name': g.enName.toString(),
        });
        gradeNames.add(g.enName.toString());
      }
    }
    Get.find<ClassMgmtController>().addGradeList(gradeNames);
    Get.find<Allstudentscontroller>().setGradeList(gradeNames);
    Get.find<StudyYearStudentsController>().setGradeList(gradeNames);
    Get.find<Student_attendence_controller>().setGradeList(gradeNames);
    Get.find<StudentAttendencController>().setGradeList(gradeNames);
    SetIsLoading(false);
    update();
  }
}
