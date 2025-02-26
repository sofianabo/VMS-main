import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';

class DropDownController extends GetxController {
  String selectedIndex = "";
  List<String> options = ["ar", "en"];

  void selectval(String? i) {
    selectedIndex = i!;
    update();
  }

  void UpdateOpt(List<String> op) {
    options = op;
    op.clear();
    update();
  }

  String sessionIndex = "";
  String gradeIndex = "";
  String classIndex = "";
  String divisionIndex = "";

  List<String> gradelist = ["first", "tow", "three"];
  List<String> classlist = [];
  List<String> divisionlist = ["one"];
  List<String> sessionlist = [];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        sessionIndex = index ?? "";
        break;
      case 'grade':
        gradeIndex = index ?? "";
        break;
      case 'class':
        classIndex = index ?? "";
        break;
      case 'division':
        divisionIndex = index ?? "";
        break;
    }
    update();
  }

// Sessions
  void setAllSession(AllSessionModel session) async {
    sessionlist.clear();
    for (int i = 0; i < session.sessions!.length; i++) {
      sessionlist.add(session.sessions![i].year.toString());
      print(session.sessions![i].year.toString());
    }
    update();
    updateList("session", sessionlist);
  }


  // Grades
   void setAllGrades(AllGradesModel grade) {
    classlist.clear();
    for (int j = 0; j < grade.grades!.length; j++) {
      classlist.add(grade.grades![j].enName.toString());
    }
    update();
    updateList("class", classlist);
  }

  //Classes




// update dropdown list
  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'session':
        sessionlist = options;
        break;
      case 'grade':
        gradelist = options; 
        break;
      case 'class':
        classlist = options;
        break;
      case 'division':
        divisionlist = options;
        break;
    }
    update();
  }

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeIndex => gradeIndex;

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;
}
