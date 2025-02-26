class AllEmployeeAttendeceModel {
  List<Attendance>? attendance;

  AllEmployeeAttendeceModel({this.attendance});

  AllEmployeeAttendeceModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? status;
  String? jobTitle;
  int? imageId;
  String? fullName;

  Attendance(
      {this.id, this.status, this.jobTitle, this.imageId, this.fullName});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    jobTitle = json['jobTitle'];
    imageId = json['imageId'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['jobTitle'] = jobTitle;
    data['imageId'] = imageId;
    data['fullName'] = fullName;
    return data;
  }
}
