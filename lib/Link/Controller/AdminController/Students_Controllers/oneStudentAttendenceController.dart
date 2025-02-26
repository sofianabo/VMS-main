import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/OneStudentAttendenceModel.dart';

class Onestudentattendencecontroller extends GetxController {
  late BuildContext context;
  List<StudentAt> studentAtt = [];
  bool isLoading = true;
  
  void setStudentAttendence(OneStudentAttendenceModel model) {
    studentAtt = model.studentAt!;
    setIsLoading(false);
    update();
  }

  setIsLoading(bool value){
    isLoading = value;
    update();
  }
 }
