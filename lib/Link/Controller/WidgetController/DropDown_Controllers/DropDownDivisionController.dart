import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';

class Dropdowndivisioncontroller extends GetxController {
  List<String> division = [];
  List<Division> allDivision = [];
  bool isLoading = true;

  bool isDisiabled = true;

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  setIsDisiabled(bool value) {
    isDisiabled = value;
    update();
  }

  void setDivision(AllDivisionModel div) {
    Get.find<Requestscontroller>().clearDivision();
    division.clear();
    allDivision = div.division!;
    List<String> newList = [];
    for (int i = 0; i < div.division!.length; i++) {
      division.add(div.division![i].enName.toString());
      newList.add(div.division![i].enName.toString());
    }
    Get.find<Allstudentscontroller>().setDivisionList(newList);
    Get.find<StudyYearStudentsController>().setDivisionList(newList);
    Get.find<Student_attendence_controller>().setDivisionList(newList);
    Get.find<StudentAttendencController>().setDivisionList(newList);
    Get.find<Add_Students_Controller>().SetDivisionlist(newList);
    setIsLoading(false);
    update();
  }
}
