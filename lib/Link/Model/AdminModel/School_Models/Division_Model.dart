class Division_Model {
  List<Division>? division;

  Division_Model({this.division});

  Division_Model.fromJson(Map<String, dynamic> json) {
    if (json['division'] != null) {
      division = <Division>[];
      json['division'].forEach((v) {
        division!.add(Division.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (division != null) {
      data['division'] = division!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Division {
  int? id;
  String? name;
  String? enName;
  String? meetUrl;
  bool? hasStudent;
  Classes? classes;

  Division(
      {this.id,
        this.name,
        this.enName,
        this.meetUrl,
        this.hasStudent,
        this.classes});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    meetUrl = json['meetUrl'];
    hasStudent = json['hasStudent'];
    classes =
    json['classes'] != null ? Classes.fromJson(json['classes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['enName'] = enName;
    data['meetUrl'] = meetUrl;
    data['hasStudent'] = hasStudent;
    if (classes != null) {
      data['classes'] = classes!.toJson();
    }
    return data;
  }
}

class Classes {
  int? id;
  String? driveUrl;
  String? name;
  String? enName;

  Classes({this.id, this.driveUrl, this.name, this.enName});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driveUrl = json['driveUrl'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['driveUrl'] = driveUrl;
    data['name'] = name;
    data['enName'] = enName;
    return data;
  }
}
