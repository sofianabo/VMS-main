import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';

class Dropdownsessioncontroller extends GetxController {
  List<String> sessions = [];

  void setSession(AllSessionModel session) {
    sessions.clear();
    for (int i = 0; i < session.sessions!.length; i++) {
      sessions.add(session.sessions![i].year.toString());
      print(session.sessions![i].year.toString());
    }
    update();
  }
}
