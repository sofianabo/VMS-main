class AllEmployeeModel {
  List<Employees>? employees;

  AllEmployeeModel({this.employees});

  AllEmployeeModel.fromJson(Map<String, dynamic> json) {
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  int? id;
  int? imageId;
  String? jobTitle;
  int? salary;
  String? fullName;
  bool? hasEmployee;
  String? email;
  String? userName;
  String? roll;

  Employees(
      {this.id,
        this.imageId,
        this.jobTitle,
        this.salary,
        this.fullName,
        this.hasEmployee,
        this.email,
        this.userName,
        this.roll});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['imageId'];
    jobTitle = json['jobTitle'];
    salary = json['salary'];
    fullName = json['fullName'];
    hasEmployee = json['hasEmployee'];
    email = json['email'];
    userName = json['userName'];
    roll = json['roll'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageId'] = imageId;
    data['jobTitle'] = jobTitle;
    data['salary'] = salary;
    data['fullName'] = fullName;
    data['hasEmployee'] = hasEmployee;
    data['email'] = email;
    data['userName'] = userName;
    data['roll'] = roll;
    return data;
  }
}
