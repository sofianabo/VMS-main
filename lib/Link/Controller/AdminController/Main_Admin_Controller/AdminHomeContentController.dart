import 'package:get/get.dart';

class AdminHomeContentController extends GetxController {
  String _content = 'Dashboard';

  String get content => _content;

  void updateContent(String newContent) {
    if (newContent != _content) {
      _content = newContent;
      update();
    }
  }
}
