import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/ExamTypeModel.dart';

class Dropdownexamtypecontroller extends GetxController {
  List<String> examType = [];
  List<Type> alltype = [];
  void setTypes(AllExamTypeModel type) {
    examType.clear();
    alltype = type.type!;
    for (int i = 0; i < type.type!.length; i++) {
      examType.add(type.type![i].name.toString());
    }
    update();
  }
}
