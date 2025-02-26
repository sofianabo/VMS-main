import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';

class All_Screen_Sessions_Controller extends GetxController {
  AllSessionModel? sessions;
  String sessionIndex = "";
  String startSessionDate = "";
  String endSessionDate = "";
  var sessionId ;
  List<String> sessionlist = [];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        sessionIndex = index ?? "";
        break;
    }
    update();
  }

  void setAllSession(AllSessionModel session) async {
    sessions = session;
    sessionlist.clear();
    sessionId = sessions!.current!.id;
    for (int i = 0; i < session.sessions!.length; i++) {
      sessionlist.add(session.sessions![i].year.toString());
    }
    update();
    updateList("session", sessionlist);
    setSessionDefult();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'session':
        sessionlist = options;
        break;
    }
    update();
  }

  String get selectedsessionIndex => sessionIndex;

   setSessionDefult() {
    try{ 
      sessionIndex = sessions!.current!.year!;
      startSessionDate = sessions!.current!.startDate!;
      endSessionDate = sessions!.current!.endDate!;
      update();
    }catch(e){
      print(e);
    }
   }

   setSessiondatepick() {
    try{
      startSessionDate = sessions!.current!.startDate!;
      endSessionDate = sessions!.current!.endDate!;
      update();
    }catch(e){
      print(e);
    }
   }

  void setsessionid(id) {
     sessionId = id;
     var session = sessions!.sessions!.firstWhere((session) => session.id == id);
     startSessionDate = session.startDate!;
     endSessionDate = session.endDate!;
    update();
  }

}
