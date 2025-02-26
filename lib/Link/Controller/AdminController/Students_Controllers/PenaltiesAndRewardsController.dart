import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/OneStudentAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/PenaltiesAndRewardsStudentModel.dart';

class Penaltiesandrewardscontroller extends GetxController {
  late BuildContext context;
  List<PenaltyStudent> penalty = [];
  bool isLoading = true;
  
  void setPenaltyAndRewards(PenaltiesAndRewardsStudentModel model) {
    penalty = model.penaltyStudent!;
    setIsLoading(false);
    update();
  }

  setIsLoading(bool value){
    isLoading = value;
    update();
  }
 }
