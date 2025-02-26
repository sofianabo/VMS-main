import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherSubjectModel.dart';
import 'package:vms_school/Link/Model/AdminModel/oneEmployeeAttendenceModel.dart';

class Teachersubjectscontroller extends GetxController {
  late BuildContext context;
  List<TeacherSubject> teacherSub = [];
  bool isLoading = true;

  void setTeacherSubject(TeacherSubjectModel model) {
    teacherSub = model.teacherSubject!;
    setIsLoading(false);
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }
}
 