class TeacherSubjectModel {
  List<TeacherSubject>? teacherSubject;

  TeacherSubjectModel({this.teacherSubject});

  TeacherSubjectModel.fromJson(Map<String, dynamic> json) {
    if (json['teacherSubject'] != null) {
      teacherSubject = <TeacherSubject>[];
      json['teacherSubject'].forEach((v) {
        teacherSubject!.add(new TeacherSubject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teacherSubject != null) {
      data['teacherSubject'] =
          this.teacherSubject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeacherSubject {
  Division? division;
  Division? classes;
  Subjects? subjects;

  TeacherSubject({this.division, this.classes, this.subjects});

  TeacherSubject.fromJson(Map<String, dynamic> json) {
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    classes =
        json['classes'] != null ? new Division.fromJson(json['classes']) : null;
    subjects = json['subjects'] != null
        ? new Subjects.fromJson(json['subjects'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.toJson();
    }
    return data;
  }
}

class Division {
  int? id;
  String? name;
  String? enName;

  Division({this.id, this.name, this.enName});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}

class Subjects {
  int? id;
  String? name;
  String? enName;
  bool? hasCurriculum;

  Subjects({this.id, this.name, this.enName, this.hasCurriculum});

  Subjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    hasCurriculum = json['hasCurriculum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['hasCurriculum'] = this.hasCurriculum;
    return data;
  }
}
