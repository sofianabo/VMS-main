import 'package:get/get.dart';
import 'package:vms_school/Link/Model/HomeModel.dart';

class Homescreencontroller extends GetxController {
  int teacher =0;
  int student =0;
  int visitor = 0;
 

  void getHomeInfo(HomeModel home) {
    teacher = home.teacher!;
    student = home.student!;
    visitor = home.visitors!;
    update();
  }

}
