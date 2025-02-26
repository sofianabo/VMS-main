import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Classes_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart'
    as cur;

class ClassMgmtController extends GetxController {
  bool isLoading = true;
  bool isCurLoading = true;
  var grades;
  List<Classes>? classes;
  List<Classes>? filteredreclasses = [];

  setGeidx(vale) {
    grades = vale;
    update();
  }

  addGradeList(List<String> values) {
    listgradeDiag = values;
    listgradeNormal = values;
    update();
  }

  addAdminList(List<String> values) {
    listAdminDiag = values;
    update();
  }

  SetClasses(Classes_Model cls) {
    classes = cls.classes;

    filteredreclasses = List.from(classes!);

    if (gradeIndex.isNotEmpty) {
      filteredreclasses = filteredreclasses!.where((emp) {
        return emp.grade!.enName == gradeIndex || emp.grade!.name == gradeIndex;
      }).toList();
    }

    SetIsLoading(false);
    update();
  }

  void searchRequestByName(String gradeindexed) {
    List<Classes> tempFilteredList = List.from(classes!);

    if (gradeindexed.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.grade!.name == gradeindexed ||
            emp.grade!.enName == gradeindexed;
      }).toList();
    }

    filteredreclasses = tempFilteredList;
    update();
  }

  String gradeIndex = "";
  String sessionIndex = "";
  String gradeDiagIndex = "";
  String sessionDiagIndex = "";
  String AdminDiagIndex = "";
  String editeGradeIndex = "";
  String editeSessionIndex = "";
  String editeAdminIndex = "";

  List<String> listgradeNormal = [];

  List<String> listsessionNormal = [];

  List<String> listgradeDiag = [];

  List<String> listsessionDiag = [];

  List<String> listAdminDiag = [];

  List<String> editeGrade = [];

  List<String> editeSession = [];

  List<String> editeAdmin = [];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'grade':
        gradeIndex = index ?? "";
        break;
      case 'session':
        sessionIndex = index ?? "";
        break;
      case 'gradediag':
        gradeDiagIndex = index ?? "";
        break;
      case 'sessiondag':
        sessionDiagIndex = index ?? "";
        break;
      case 'admin':
        AdminDiagIndex = index ?? "";
        break;
      case 'editeGrade':
        editeGradeIndex = index ?? "";
        break;
      case 'editeSession':
        editeSessionIndex = index ?? "";
        break;
      case 'editeAdmin':
        editeAdminIndex = index ?? "";
        break;
    }

    if (type == "grade") {
      searchRequestByName(gradeIndex);
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'grade':
        listgradeNormal = options;
        break;
      case 'session':
        listsessionNormal = options;
        break;
      case 'gradediag':
        listgradeDiag = options;
        break;
      case 'sessiondag':
        listsessionDiag = options;
        break;
      case 'admin':
        listAdminDiag = options;
        break;

      case 'editeGrade':
        editeGrade = options;
        break;

      case 'editeSession':
        editeSession = options;
        break;

      case 'editeAdmin':
        editeAdmin = options;
        break;
    }
    update();
  }

  String get selectedgradeIndex => gradeIndex;

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeDiagIndex => gradeDiagIndex;

  String get selectedsessionDiagIndex => sessionDiagIndex;

  String get selectedAdminDiagIndex => AdminDiagIndex;

  String get editeGradeIndexs => editeGradeIndex;

  String get editeSessionIndexs => editeSessionIndex;

  String get editeAdminIndexs => editeAdminIndex;

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void SetCurriculm(bool value) {
    isCurLoading = value;
    update();
  }

  List<cur.Curriculum>? curriculum;
  String? filterName = '';
  List<cur.Curriculum> filteredCurriculum = [];
  List<int> selectedCurriculums = [];
  List<String> selectedCurriculumNames = [];

  void clearFilter() {
    searchByName("");
    update();
  }

  void searchByName(String? nameQuery) {
    List<cur.Curriculum> tempFilteredList = List.from(curriculum!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        final curenName = cur.enName?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase()) ||
            curenName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filteredCurriculum = tempFilteredList;
    update();
  }

  void SetCurriculum(cur.Curriculum_Model curriculumModel) {
    curriculum = curriculumModel.curriculum;
    filteredCurriculum = List.from(curriculum!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    update();
  }

  void toggleSelection(int curriculumId) {
    if (selectedCurriculums.contains(curriculumId)) {
      selectedCurriculums.remove(curriculumId);
      selectedCurriculumNames.removeWhere((name) =>
          name ==
          curriculum!.firstWhere((cur) => cur.id == curriculumId).enName);
    } else {
      selectedCurriculums.add(curriculumId);
      selectedCurriculumNames
          .add(curriculum!.firstWhere((cur) => cur.id == curriculumId).enName!);
    }
    print("Selected Curriculum IDs: $selectedCurriculums");
    print("Selected Curriculum Names: $selectedCurriculumNames");
    update();
  }

  void resetSelections() {
    selectedCurriculums = List.from(selectedCurriculums);
    update();
  }

  List<String> getSelectedCurriculumNames() {
    return selectedCurriculumNames;
  }

  void selectCurriculumsForClass(List<Curriculum>? curriculums) {
    selectedCurriculums.clear();
    selectedCurriculumNames.clear();

    if (curriculums != null) {
      for (var curriculum in curriculums) {
        selectedCurriculums.add(curriculum.id!);
        selectedCurriculumNames
            .add(curriculum.enName ?? curriculum.name ?? 'Unknown');
      }
    }
    update();
  }
}
