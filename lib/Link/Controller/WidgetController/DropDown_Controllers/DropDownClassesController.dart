import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';

class Dropdownclassescontroller extends GetxController {
  List<String> classes = [];
  List<Classes> Allclass = [];
  bool Isloading = true ;
  void setClasses(AllClassModel clas) {
    Allclass = clas.classes!;
    classes.clear();
    for (int i = 0; i < clas.classes!.length; i++) {
      classes.add(clas.classes![i].enName.toString());
    }
    setIsLoading(false);
    update();
  }

   setIsLoading(bool value) {

    Isloading = value;
    update();
   }
}
