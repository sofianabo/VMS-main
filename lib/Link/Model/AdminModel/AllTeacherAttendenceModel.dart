class AllTeacherAttendenceModel {
  List<Teacherattendance>? teacherattendance;

  AllTeacherAttendenceModel({this.teacherattendance});

  AllTeacherAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['teacherattendance'] != null) {
      teacherattendance = <Teacherattendance>[];
      json['teacherattendance'].forEach((v) {
        teacherattendance!.add(Teacherattendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teacherattendance != null) {
      data['teacherattendance'] =
          teacherattendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teacherattendance {
  int? id;
  String? status;
  int? imageId;
  String? email;
  String? fullName;
  List<Classes>? classes;
  List<Subject>? subject;

  Teacherattendance(
      {this.id,
      this.status,
      this.imageId,
      this.email,
      this.fullName,
      this.classes,
      this.subject});

  Teacherattendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    imageId = json['imageId'];
    email = json['email'];
    fullName = json['fullName'];
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(Classes.fromJson(v));
      });
    }
    if (json['subject'] != null) {
      subject = <Subject>[];
      json['subject'].forEach((v) {
        subject!.add(Subject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['imageId'] = imageId;
    data['email'] = email;
    data['fullName'] = fullName;
    if (classes != null) {
      data['classes'] = classes!.map((v) => v.toJson()).toList();
    }
    if (subject != null) {
      data['subject'] = subject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  int? id;
  String? name;
  String? enName;

  Classes({this.id, this.name, this.enName});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['enName'] = enName;
    return data;
  }
}

class Subject {
  int? id;
  String? name;
  String? enName;

  Subject({this.id, this.name, this.enName});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['enName'] = enName;
    return data;
  }
}
