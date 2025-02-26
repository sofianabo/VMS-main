import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/allGuardianModel.dart';

class Allgaurdiancontroller extends GetxController {
  List<Gaurdians>? guardian;
  List<Gaurdians>? filteredregaurdians;
  String? filteredName = "";
  String? garduansid = "";
  bool isLoading = true;
  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void clearFilter() {
    searchGaurdian("");
    update();
  }

  void searchGaurdian(String Query) {
    List<Gaurdians> tempFilteredList = List.from(guardian!);
    filteredName = Query;
    if (Query.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.name!.contains(Query.toLowerCase()) ||
            emp.nationalId!.contains(Query.toLowerCase()) ||
            emp.email!.contains(Query.toLowerCase()) ||
            emp.userName!.contains(Query.toLowerCase()) ||
            emp.phone!.contains(Query.toLowerCase());
      }).toList();
    }

    filteredregaurdians = tempFilteredList;
    update();
  }

  void setallGaurdian(AllGuardianModel model) {
    guardian = model.gaurdians!;
    filteredregaurdians = List.from(guardian!);
    searchGaurdian(filteredName!);
    setIsLoading(false);
    update();
  }

  void updateGuardian(
      String name, int index, String phone, String email, String nationalId) {
    filteredregaurdians![index].name = name;
    filteredregaurdians![index].phone = phone;
    filteredregaurdians![index].email = email;
    filteredregaurdians![index].nationalId = nationalId;
    update();
  }
}
