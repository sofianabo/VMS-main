import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllTeacherModel.dart';
import 'package:vms_school/Link/Model/AdminModel/DropDownCuriculmModel.dart';
import 'package:vms_school/Link/Model/AdminModel/SchoolTimeModel.dart';
import 'package:vms_school/view/Admin/School_Management/SchoolTimeTable.dart';

class AdminSchoolTimeController extends GetxController {
  String examClassIndex = "";
  String examDivisionIndex = "";
  String subjectDialogIndex = "";
  String teacherDialogIndex = "";
  String timeLessonIndex = "Morning";

  List<String> examClass = [];
  List<String> examDivision = [];
  List<Division>? allDivision;
  List<String> subjectDialogList = [];
  List<String> teacherDialogList = [];
  List<StudyShare> studyshare = [];
  List<String> timeLessonList = ['Morning', 'Evening'];

  bool isLoading = true;
  bool isLoadingClass = true;
  bool isLoadingDivision = true;

  setIsLoadingClass(bool value) {
    isLoadingClass = value;
    update();
  }

  setIsLoadingDivision(bool value) {
    isLoadingDivision = value;
    update();
  }

  void initStudyShare() {
    tableData.clear();
    update();
  }

  void setStudyShare(SchoolTimeModel model) {
    studyshare = model.studyShare!;
    setIsLoading(false);

    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'class':
        examClassIndex = index ?? "";
        break;
      case 'division':
        examDivisionIndex = index ?? "";
        break;
      case 'subjectDialog':
        subjectDialogIndex = index ?? "";
        break;
      case 'teacherDialog':
        teacherDialogIndex = index ?? "";
        break;
      case 'time':
        timeLessonIndex = index ?? "";
        break;
    }
    update();
  }

  void setAllClasses(AllClassModel clas) {
    examClass.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
      examClass.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("class", examClass);
  }

  void setAllDivision(AllDivisionModel division) {
    examDivision.clear();
    setIsLoadingDivision(false);
    allDivision = division.division;
    for (int j = 0; j < division.division!.length; j++) {
      examDivision.add(division.division![j].enName.toString());
    }
    update();
    updateList("division", examDivision);
  }

  void setAllTeacherDialog(AllTeacherModel teach) {
    teacherDialogList.clear();
    for (int j = 0; j < teach.teachers!.length; j++) {
      teacherDialogList.add(teach.teachers![j].fullName.toString());
    }
    update();
    updateList("teacherDialog", teacherDialogList);
  }

  void setAllSubjectDialog(DropDowmCuriculmModel? curr) {
    subjectDialogList.clear();
    for (int j = 0; j < curr!.curriculum!.length; j++) {
      subjectDialogList.add(curr.curriculum![j].name.toString());
    }

    update();
    updateList("subjectDialog", subjectDialogList);
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'class':
        examClass = options;
        break;
      case 'division':
        examDivision = options;
        break;
      case 'teacherDialog':
        teacherDialogList = options;
        break;
      case 'subjectDialog':
        subjectDialogList = options;
        break;
      case 'time':
        timeLessonList = options;
        break;
    }
    update();
  }

  String get selectedExamClass => examClassIndex;

  String get selectedExamDivision => examDivisionIndex;
  String get selectedSubjectDialog => subjectDialogIndex;
  String get selectedTeacherDialog => teacherDialogIndex;
  String get selectedTimeLesson => timeLessonIndex;

  void setDevisionindex() {
    examDivisionIndex = "";
    update();
  }

  void setClassIndex() {
    examClassIndex = "";
    update();
  }

  SetClasslist(List<String> data) {
    examClass = data;
    setIsLoadingClass(false);
    update();
  }
}
