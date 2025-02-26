import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/DropDownCuriculmModel.dart';

class Dropdowncuriculmcontroller extends GetxController {
  List<String> curiculmList = [];
  List<Curriculum> allCuriculm = [];
  void setCuriculm(DropDowmCuriculmModel model) {
    curiculmList.clear();
    allCuriculm = model.curriculum!;
    for (int i = 0; i < model.curriculum!.length; i++) {
      curiculmList.add(model.curriculum![i].name.toString());
    }
    update();
  }
}
