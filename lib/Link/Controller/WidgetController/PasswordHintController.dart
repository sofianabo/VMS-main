import 'package:get/get.dart';

class PasswordHintController extends GetxController {
  bool isVisible = true;

  notHint() {
    isVisible = true;
    update();
  }

  hint() {
    isVisible = false;
    update();
  }
}
