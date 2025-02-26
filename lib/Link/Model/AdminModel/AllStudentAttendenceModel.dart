class AllStudentAttendenceModel {
  List<Attendance>? attendance;

  AllStudentAttendenceModel({this.attendance});

  AllStudentAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(Attendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (attendance != null) {
      data['attendance'] = attendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendance {
  String? status;
  String? date;
  String? cause;
  int? id;
  int? divisionId;
  int? fileId;
  int? studentId;
  String? fullName;
  Division? division;
  Division? classes;
  Division? grade;

  Attendance(
      {this.status,
        this.date,
        this.cause,
        this.id,
        this.divisionId,
        this.fileId,
        this.studentId,
        this.fullName,
        this.division,
        this.classes,
        this.grade});

  Attendance.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    date = json['date'];
    cause = json['cause'];
    id = json['id'];
    divisionId = json['divisionId'];
    fileId = json['fileId'];
    studentId = json['studentId'];
    fullName = json['fullName'];
    division = json['division'] != null
        ? Division.fromJson(json['division'])
        : null;
    classes =
    json['classes'] != null ? Division.fromJson(json['classes']) : null;
    grade = json['grade'] != null ? Division.fromJson(json['grade']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['date'] = date;
    data['cause'] = cause;
    data['id'] = id;
    data['divisionId'] = divisionId;
    data['fileId'] = fileId;
    data['studentId'] = studentId;
    data['fullName'] = fullName;
    if (division != null) {
      data['division'] = division!.toJson();
    }
    if (classes != null) {
      data['classes'] = classes!.toJson();
    }
    if (grade != null) {
      data['grade'] = grade!.toJson();
    }
    return data;
  }
}

class Division {
  String? name;
  String? enName;

  Division({this.name, this.enName});

  Division.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['enName'] = enName;
    return data;
  }
}
