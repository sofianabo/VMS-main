class IncreaseEmpolyeeAttendenceModel {
  List<Employee>? employee;
  List<String>? noAttendanceDatas;

  IncreaseEmpolyeeAttendenceModel({this.employee, this.noAttendanceDatas});

  IncreaseEmpolyeeAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['employee'] != null) {
      employee = <Employee>[];
      json['employee'].forEach((v) {
        employee!.add(Employee.fromJson(v));
      });
    }
    noAttendanceDatas = json['noAttendanceDatas'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employee != null) {
      data['employee'] = employee!.map((v) => v.toJson()).toList();
    }
    data['noAttendanceDatas'] = noAttendanceDatas;
    return data;
  }
}

class Employee {
  int? id;
  String? fullName;
  int? imageId;

  Employee({this.id, this.fullName, this.imageId});

  Employee.fromJson(Map<String, dynamic> json) {
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
