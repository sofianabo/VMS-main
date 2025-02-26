import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSemesterModel.dart';
import 'package:vms_school/Link/Model/AdminModel/DropDownCuriculmModel.dart';
import 'package:vms_school/Link/Model/AdminModel/ExamTableModel.dart';
import 'package:vms_school/Link/Model/AdminModel/ExamTypeModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class ExamTableController extends GetxController {
  String examTypeIndex = "";
  String examClassIndex = "";
  String examSeasonIndex = "";
  String typeDialogIndex = "";
  String curiculmDialogIndex = "";
  String classDialogIndex = "";
  String semesterDialogIndex = "";

  List<String> examType = [];
  List<String> examClass = [];
  List<String> examSeason = [];
  List<String> typeDialogList = [];
  List<String> curiculmDialogList = [];
  List<String> classDialogList = [];
  List<String> semesterDialogList = [];

  bool isCuriculmLoading = true;
  bool isLoading = true;
  bool isTypeLoading = true;
  bool isClassLoading = true;

  setIsTypeLoading(bool value) {
    isTypeLoading = value;
    update();
  }

  setIsClassLoading(bool value) {
    isClassLoading = value;
    update();
  }

  List<Quiz> quizList = [];
  List<Classes> Allclass = [];
  List<Semester> allSemester = [];
  List<Quiz>? filteredquiz;

  void setAllQuiz(ExamTableModel model) {
    quizList.clear();
    quizList = model.quiz!;
    filteredquiz = model.quiz!;
    setIsLoading(false);
    if (examSeasonIndex.isNotEmpty) {
      filteredquiz = filteredquiz!.where((emp) {
        return emp.semester!.name == examSeasonIndex ||
            emp.semester!.enName == examSeasonIndex;
      }).toList();
    }
    if (examTypeIndex.isNotEmpty) {
      filteredquiz = filteredquiz!.where((emp) {
        return emp.type! == examTypeIndex;
      }).toList();
    }
    if (examClassIndex.isNotEmpty) {
      filteredquiz = filteredquiz!.where((emp) {
        return emp.classese!.name == examClassIndex ||
            emp.type! == examClassIndex;
      }).toList();
    }

    update();
  }

  void clearFilter() {
    searchRequestByName(examSeasonIndex, examTypeIndex, examClassIndex);
    update();
  }

  void searchRequestByName(String semseter, String type, String classes) {
    List<Quiz> tempFilteredList = List.from(quizList);

    if (semseter.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.semester!.enName!.toLowerCase() == semseter.toLowerCase();
      }).toList();
    }
    if (type.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.type!.toLowerCase() == type.toLowerCase();
      }).toList();
    }
    if (classes.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.classese!.enName!.toLowerCase() == classes.toLowerCase();
      }).toList();
    }

    filteredquiz = tempFilteredList;
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'type':
        examTypeIndex = index ?? "";
        break;
      case 'class':
        examClassIndex = index ?? "";
        break;
      case 'season':
        examSeasonIndex = index ?? "";
        break;
      case 'typeDialog':
        typeDialogIndex = index ?? "";
        break;
      case 'curiculmDialog':
        curiculmDialogIndex = index ?? "";
        break;
      case 'classDialog':
        classDialogIndex = index ?? "";
        break;
      case 'semesterDialog':
        semesterDialogIndex = index ?? "";
        break;
    }
    searchRequestByName(examSeasonIndex, examTypeIndex, examClassIndex);

    update();
  }

  void setAllTypes(AllExamTypeModel types) {
    examType.clear();
    for (int j = 0; j < types.type!.length; j++) {
      
      examType.add(types.type![j].name.toString());
    }
    update();
    updateList("type", examType);
  }

  void setAllSemesterDialog(AllSemesterModel sem) {
    semesterDialogList.clear();
    allSemester = sem.semester!;
    for (int j = 0; j < sem.semester!.length; j++) {
      if(prefs!.getString(languageKey)=='ar')
            semesterDialogList.add(sem.semester![j].name.toString());
else
      semesterDialogList.add(sem.semester![j].enName.toString());
    }
    update();
    updateList("semesterDialog", semesterDialogList);
  }

  void setAllTypesDialog(AllExamTypeModel types) {
    typeDialogList.clear();
    for (int j = 0; j < types.type!.length; j++) {
      typeDialogList.add(types.type![j].name.toString());
    }
    update();
    updateList("typeDialog", typeDialogList);
  }

  void setAllClasses(AllClassModel clas) {
    examClass.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
            if(prefs!.getString(languageKey)=='ar')
      examClass.add(clas.classes![j].name.toString());
else
      examClass.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("class", examClass);
  }

  void setAllClassesDialog(AllClassModel clas) {
    classDialogList.clear();
    Allclass = clas.classes!;
    for (int j = 0; j < clas.classes!.length; j++) {
                  if(prefs!.getString(languageKey)=='ar')
      classDialogList.add(clas.classes![j].name.toString());
else
      classDialogList.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("classDialog", classDialogList);
  }

  // setClassList(List<String> value) {
  //   classDialogIndex = "";
  //   classDialogList.clear();
  //   classDialogList = value;
  //   setCuriculmLoading(false);
  //   update();
  // }

  setCuriculmLoading(bool value) {
    isCuriculmLoading = value;
    update();
  }

  void setAllSeason(AllSemesterModel semster) {
    examSeason.clear();
    for (int l = 0; l < semster.semester!.length; l++) {
      if(prefs!.getString(languageKey)=='ar')
            examSeason.add(semster.semester![l].name.toString());
else
      examSeason.add(semster.semester![l].enName.toString());
    }
    update();
    updateList("season", examSeason);
  }

  void setAllCuriculm(DropDowmCuriculmModel model) {
    for (int l = 0; l < model.curriculum!.length; l++) {
            if(prefs!.getString(languageKey)=='ar')

      curiculmDialogList.add(model.curriculum![l].name.toString());
      else
            curiculmDialogList.add(model.curriculum![l].enName.toString());

    }
    update();
    updateList("curiculmDialog", curiculmDialogList);
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'type':
        examType = options;
        break;
      case 'class':
        examClass = options;
        break;
      case 'season':
        examSeason = options;
        break;
      case 'typeDialog':
        typeDialogList = options;
        break;
      case 'curiculmDialog':
        curiculmDialogList = options;
        break;
      case 'classDialog':
        classDialogList = options;
        break;
      case 'semesterDialog':
        semesterDialogList = options;
        break;
    }
    update();
  }

  Rx<DateTime?> dateindex = Rx<DateTime?>(null);
  void selectDateIndex(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateindex.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateindex.value = picked;
    }
  }

  String get selectedExamType => examTypeIndex;

  String get selectedExamClass => examClassIndex;

  String get selectedExamSeason => examSeasonIndex;
  String get selectedTypeDialog => typeDialogIndex;
  String get selectedClassDailog => classDialogIndex;
  String get selectedCuriculmDialog => curiculmDialogIndex;
  String get selectedSemesterDialog => semesterDialogIndex;
  Rx<DateTime?> get selectedexamDate => dateindex;
}
