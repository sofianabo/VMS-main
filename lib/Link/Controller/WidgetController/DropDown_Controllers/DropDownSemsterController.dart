import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSemesterModel.dart';

class Dropdownsemstercontroller extends GetxController {
  List<String> semesters = [];
  List<Semester> allSemester = [];

  void setsemester(AllSemesterModel model) {

    semesters.clear();
        allSemester = model.semester!;
    for (int i = 0; i < model.semester!.length; i++) {
      semesters.add(model.semester![i].enName.toString());
    }
    update();
  }
}
