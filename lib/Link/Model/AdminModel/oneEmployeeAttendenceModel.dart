class oneEmployeeAttendenceModel {
  List<EmployeeAttendance>? employeeAttendance;

  oneEmployeeAttendenceModel({this.employeeAttendance});

  oneEmployeeAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['employeeAttendance'] != null) {
      employeeAttendance = <EmployeeAttendance>[];
      json['employeeAttendance'].forEach((v) {
        employeeAttendance!.add(EmployeeAttendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employeeAttendance != null) {
      data['employeeAttendance'] =
          employeeAttendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeAttendance {
  String? date;
  String? status;
  String? cause;

  EmployeeAttendance({this.date, this.status, this.cause});

  EmployeeAttendance.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    status = json['status'];
    cause = json['cause'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['status'] = status;
    data['cause'] = cause;
    return data;
  }
}
