import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/viraul_Classes_Model.dart';

class Virtual_Employee_Controller extends GetxController{

  bool isLoading = true;
  List<ViraulClasses>? viraulClasses;
  var vecUserID;





  List<Map<String, dynamic>> Admins = [];



  setVECUserID(vale){
    vecUserID = vale; 
    update();
  }

  SetIsLoading (bool value){
    isLoading = value;
    update();
  }

  SetVirtualClass(viraul_Classes_Model vcm){
    viraulClasses = vcm.viraulClasses;
    SetIsLoading(false);

    Admins.clear();
    List<String> gradeNames = [];
    if (vcm.viraulClasses != null) {
      for (var g in vcm.viraulClasses!) {
        Admins.add({
          'id': g.id,
          'userName': g.userName.toString(),
        });
        gradeNames.add(g.userName.toString());
      }
    }

    Get.find<ClassMgmtController>().addAdminList(gradeNames);

    update();
  }

}