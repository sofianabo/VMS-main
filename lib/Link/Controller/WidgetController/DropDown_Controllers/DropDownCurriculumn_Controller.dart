import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class Curriculumn_Controller extends GetxController {
  List<Curriculum>? curriculum;
  String? filterName = '';
  String? filterSemester = '';
  String? filterSubject = '';
  List<Curriculum> filteredCurriculum = [];
  int? semesterId;
  int? subjectId;

  void clearFilter() {
    searchByName("", semesterIndex, subjectIndex);
    update();
  }

  void searchByName(String? nameQuery, String? semester, String? subject) {
    List<Curriculum> tempFilteredList = List.from(curriculum!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        final curenName = cur.enName?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase()) ||
            curenName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    if (semester != null && semester.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.semester!.enName == semester ||
            cur.semester!.name == semester;
      }).toList();
    }

    if (subject != null && subject.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.subject!.enName == subject || cur.subject!.name == subject;
      }).toList();
    }

    filteredCurriculum = tempFilteredList;
    update();
  }

  bool isFailingSubject = false;
  bool isLoading = true;
  bool isHoveringFile = false;
  String fileStatus = "Click To Add File\nOr\nDrag And Drop File Here";
  bool isHoveringimage = false;
  String imageStatus = "Click To Add Image\nOr\nDrag And Drop Image Here";

  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);

  Rx<Uint8List?> selectedFile = Rx<Uint8List?>(null);
  RxString fileName = "".obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      Uint8List fileBytes = await pickedFile.readAsBytes();
      selectedImage.value = fileBytes;
      updateTextImage("Done Selected Image");
    } else {}
  }

  Future<void> pickPDFFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.bytes != null) {
      selectedFile.value = result.files.single.bytes;
      fileName.value = result.files.single.name;

      updateTextFile("Done Selected File");
    }
  }

  void updateHoverFile(bool value) {
    isHoveringFile = value;
    update();
  }

  void updateHoverImage(bool value) {
    isHoveringimage = value;
    update();
  }

  void updateTextImage(String value) {
    imageStatus = value;
    update();
  }

  void updateTextFile(String value) {
    fileStatus = value;
    update();
  }

  void updateSelection(bool value) {
    isFailingSubject = value;
    update();
  }

  String subjectIndex = "";
  String semesterIndex = "";
  String dialog_SubjectIndex = "";
  String dialog_SemesterIndex = "";

  List<String> listsubject = [];
  List<String> list_Dialog_Subject = [];
  List<String> list_Dialog_semester = [
    "The First Semester",
    "The Second Semester",
    "The Third Semester",
  ];
  List<String> listSemester = [
    "The First Semester",
    "The Second Semester",
    "The Third Semester",
  ];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'Subject':
        subjectIndex = index ?? "";
        break;
      case 'Dialog_Subject':
        dialog_SubjectIndex = index ?? "";
        break;
      case 'semester':
        semesterIndex = index ?? "";
        break;
      case 'Dialog_semester':
        dialog_SemesterIndex = index ?? "";
        break;
    }
    searchByName(filterName, semesterIndex, subjectIndex);
    update();
  }

  void SetCurriculum(Curriculum_Model curriculumModel) {
    curriculum = curriculumModel.curriculum;
    filteredCurriculum = List.from(curriculum!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), semesterIndex, subjectIndex);
    }

    if (semesterIndex.isNotEmpty) {
      filteredCurriculum = filteredCurriculum.where((emp) {
        return emp.semester!.name == semesterIndex ||
            emp.semester!.enName == semesterIndex;
      }).toList();
    }
    if (subjectIndex.isNotEmpty) {
      filteredCurriculum = filteredCurriculum.where((emp) {
        return emp.subject!.name == subjectIndex ||
            emp.subject!.enName == subjectIndex;
      }).toList();
    }

    SetIsLoading(false);
    update();
  }

  void addlistsubject(List<String> data) {
    listsubject.clear();
    list_Dialog_Subject.clear();
    subjectIndex = "";
    listsubject.addAll(data);
    list_Dialog_Subject.addAll(data);
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'Subject':
        listsubject = options;
        break;
      case 'Dialog_Subject':
        list_Dialog_Subject = options;
        break;
      case 'semester':
        listSemester = options;
        break;
      case 'Dialog_semester':
        list_Dialog_semester = options;
        break;
    }
    update();
  }

  String get selectsubjectIndex => subjectIndex;

  String get selectsemesterIndex => semesterIndex;

  String get selectdialog_SubjectIndex => dialog_SubjectIndex;
  String get selectdialog_SemesterIndex => dialog_SemesterIndex;

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void set_subjectIdx(id) {
    subjectId = id;
    update();
  }

  void set_semesteridx(id) {
    semesterId = id;
    update();
  }
}
