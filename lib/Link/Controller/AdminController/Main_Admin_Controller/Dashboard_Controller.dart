import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/Dashboard_Model.dart';

class Dashboard_Controller extends GetxController {
  DashboardModel? dsh;
  bool Isloading = true;

  void AddData(DashboardModel data) {
    dsh = data;
    Isloading = false;
    update();
  }

}
