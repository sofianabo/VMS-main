import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Virtual_Employee_Model.dart';

class All_Virtual_Employee_Controller extends GetxController {
  bool isLoading = true;
  List<ViraulUser>? viraulUser;
  List<ViraulUser>? filteredviraulUser;
  String filteredName = "";

  SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  setData(Virtual_Employee_Model vem) {
    viraulUser = vem.viraulUser;
    isLoading = false;
    searchRequestByName(
        filteredName, Get.find<Allempolyeecontroller>().rollIndex);
    update();
  }

  void clearFilter() {
    searchRequestByName("", Get.find<Allempolyeecontroller>().rollIndex);
    update();
  }

  void searchRequestByName(String query, String jobindexed) {
    List<ViraulUser> tempFilteredList = List.from(viraulUser!);
    if (query.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        final empName = emp.userName?.toLowerCase() ?? '';
        return empName.contains(query.toLowerCase());
      }).toList();
    }
    filteredName = query;
    if (jobindexed.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.roll!.toLowerCase() == jobindexed.toLowerCase();
      }).toList();
    }

    filteredviraulUser = tempFilteredList;
    update();
  }
}
