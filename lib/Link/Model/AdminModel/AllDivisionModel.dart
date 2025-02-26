class AllDivisionModel {
  List<Division>? division;

  AllDivisionModel({this.division});

  AllDivisionModel.fromJson(Map<String, dynamic> json) {
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
  int? classId;
  String? name;
  String? enName;
  String? meetUrl;

  Division({this.id, this.classId, this.name, this.enName, this.meetUrl});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classId = json['classId'];
    name = json['name'];
    enName = json['enName'];
    meetUrl = json['meetUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['classId'] = classId;
    data['name'] = name;
    data['enName'] = enName;
    data['meetUrl'] = meetUrl;
    return data;
  }
}
