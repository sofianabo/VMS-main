class AllGradesModel {
  List<Grades>? grades;

  AllGradesModel({this.grades});

  AllGradesModel.fromJson(Map<String, dynamic> json) {
    if (json['grades'] != null) {
      grades = <Grades>[];
      json['grades'].forEach((v) {
        grades!.add(Grades.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (grades != null) {
      data['grades'] = grades!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Grades {
  int? id;
  String? name;
  String? enName;
  int? feeCount;
  int? hasStudent;

  Grades({this.id, this.name, this.enName, this.feeCount, this.hasStudent});

  Grades.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    feeCount = json['feeCount'];
    hasStudent = json['hasStudent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['enName'] = enName;
    data['feeCount'] = feeCount;
    data['hasStudent'] = hasStudent;
    return data;
  }
}
