import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllPenaltyModel.dart'as gr;

class Penaltycontroller extends GetxController {


  var Penalties = <Map<String, dynamic>>[
  ].obs;



  List<gr.Penalty>? penalt;



  bool isLoading = true;

  setData(gr.AllPenaltyModel pen) {
    penalt = pen.penalty;
    Penalties.clear();
    for (var stu in pen.penalty!) {
      Penalties.add({
        'id': stu.id.toString(),
        'name': stu.name.toString(),
        'enName': stu.enName.toString(),
        'description':stu.description.toString(),
      });
    }
    setIsLoading(false);
    update();
  }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }

  DeletePenalty(int index) {
    Penalties.removeAt(index);
    update();
  }

}
