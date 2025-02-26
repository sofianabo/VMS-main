import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/Location_Model.dart';

class Location_controller extends GetxController {
  List<Location>? location;
  bool isLoading = true;
  String Locationsid = "";

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  setLocationsid(int idx) {
    Locationsid = location![idx].id.toString();
    update();
  }

  void setLocations(Location_Model locations) {
    print("object1");
    print("${locations.location!.length} dfslkjfdsjlkdfsjljlkdjlkdsfjlk");
    location = locations.location;

    List<String> newList = [];

    for (int i = 0; i < locations.location!.length; i++) {
      newList.add(locations.location![i].enName.toString());
    }

    print("object");
    Get.find<Add_Students_Controller>().SetLocationlist(newList);
    Get.find<Vaccines_Controller>().SetLocationlist(newList);

    setIsLoading(false);
    update();
  }
}
