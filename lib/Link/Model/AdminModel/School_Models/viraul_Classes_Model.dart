class viraul_Classes_Model {
  List<ViraulClasses>? viraulClasses;

  viraul_Classes_Model({this.viraulClasses});

  viraul_Classes_Model.fromJson(Map<String, dynamic> json) {
    if (json['viraulClasses'] != null) {
      viraulClasses = <ViraulClasses>[];
      json['viraulClasses'].forEach((v) {
        viraulClasses!.add(ViraulClasses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (viraulClasses != null) {
      data['viraulClasses'] =
          viraulClasses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViraulClasses {
  int? id;
  String? userName;

  ViraulClasses({this.id, this.userName});

  ViraulClasses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    return data;
  }
}
