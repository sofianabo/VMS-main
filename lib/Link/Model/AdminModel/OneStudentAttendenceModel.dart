class OneStudentAttendenceModel {
  List<StudentAt>? studentAt;

  OneStudentAttendenceModel({this.studentAt});

  OneStudentAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['studentAt'] != null) {
      studentAt = <StudentAt>[];
      json['studentAt'].forEach((v) {
        studentAt!.add(StudentAt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (studentAt != null) {
      data['studentAt'] = studentAt!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentAt {
  dynamic cause;
  String? date;
  String? status;

  StudentAt({this.cause, this.date, this.status});

  StudentAt.fromJson(Map<String, dynamic> json) {
    cause = json['cause'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cause'] = cause;
    data['date'] = date;
    data['status'] = status;
    return data;
  }
}
