import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AuthModel/UserModel.dart';
import 'package:vms_school/main.dart';

class UserController extends GetxController {
  String? token;
  String? roll;
  bool? verified;
  bool? hasData;

  bool Isloading = false;

  SetIsloading(bool value){
    Isloading = value;
    update();
  }

  void GetuserInfo(UserModel user) {
    token = user.token;
    roll = user.roll;
    verified = user.verified;
    hasData = user.hasData;
    prefs!.setString("token", token!);
    SetIsloading(false);
    update();
  }
}
