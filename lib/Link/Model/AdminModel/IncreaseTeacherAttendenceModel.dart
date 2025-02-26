class IncreaseTeacherAttendenceModel {
  List<Teacher>? teacher;
  List<String>? noAttendanceDatas;

  IncreaseTeacherAttendenceModel({this.teacher, this.noAttendanceDatas});

  IncreaseTeacherAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['teacher'] != null) {
      teacher = <Teacher>[];
      json['teacher'].forEach((v) {
        teacher!.add(Teacher.fromJson(v));
      });
    }
    noAttendanceDatas = json['noAttendanceDatas'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teacher != null) {
      data['teacher'] = teacher!.map((v) => v.toJson()).toList();
    }
    data['noAttendanceDatas'] = noAttendanceDatas;
    return data;
  }
}

class Teacher {
  int? id;
  String? fullName;
  dynamic imageId;

  Teacher({this.id, this.fullName, this.imageId});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['imageId'] = imageId;
    return data;
  }
}
