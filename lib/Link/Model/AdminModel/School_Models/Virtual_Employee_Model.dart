class Virtual_Employee_Model {
  List<ViraulUser>? viraulUser;

  Virtual_Employee_Model({this.viraulUser});

  Virtual_Employee_Model.fromJson(Map<String, dynamic> json) {
    if (json['viraulUser'] != null) {
      viraulUser = <ViraulUser>[];
      json['viraulUser'].forEach((v) {
        viraulUser!.add(ViraulUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (viraulUser != null) {
      data['viraulUser'] = viraulUser!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViraulUser {
  int? id;
  String? roll;
  String? userName;
  bool? hasclasses;

  ViraulUser({this.id, this.roll, this.userName, this.hasclasses});

  ViraulUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roll = json['roll'];
    userName = json['userName'];
    hasclasses = json['hasclasses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['roll'] = roll;
    data['userName'] = userName;
    data['hasclasses'] = hasclasses;
    return data;
  }
}
