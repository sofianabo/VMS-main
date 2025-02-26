import 'package:get/get.dart';

class CheckboxController extends GetxController {
  RxInt selectedIndex = 0.obs;
  selectcheck(int i) {
    selectedIndex = i.obs;
    update();
  }
  // 0 for first checkbox, 1 for second checkbox
}
