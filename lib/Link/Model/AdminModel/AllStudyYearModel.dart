class AllStudyYearModel {
  List<Students>? students;

  AllStudyYearModel({this.students});

  AllStudyYearModel.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? id;
  int? fileId;
  String? state;
  String? fullName;
  String? email;
  Division? division;
  Division? classes;
  Division? grade;
  Guardians? guardians;
  String? userName;

  Students(
      {this.id,
      this.fileId,
      this.state,
      this.fullName,
      this.email,
      this.division,
      this.classes,
      this.grade,
      this.guardians,
      this.userName});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['fileId'];
    state = json['state'];
    fullName = json['fullName'];
    email = json['email'];
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    classes =
        json['classes'] != null ? new Division.fromJson(json['classes']) : null;
    grade = json['grade'] != null ? new Division.fromJson(json['grade']) : null;
    guardians = json['guardians'] != null
        ? new Guardians.fromJson(json['guardians'])
        : null;
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileId'] = this.fileId;
    data['state'] = this.state;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    if (this.guardians != null) {
      data['guardians'] = this.guardians!.toJson();
    }
    data['userName'] = this.userName;
    return data;
  }
}

class Division {
  String? name;
  String? enName;

  Division({this.name, this.enName});

  Division.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['EnName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['EnName'] = this.enName;
    return data;
  }
}

class Guardians {
  int? id;
  String? name;
  String? phone;
  String? nationalId;
  String? email;
  String? userName;

  Guardians(
      {this.id,
      this.name,
      this.phone,
      this.nationalId,
      this.email,
      this.userName});

  Guardians.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    email = json['email'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['nationalId'] = this.nationalId;
    data['email'] = this.email;
    data['userName'] = this.userName;
    return data;
  }
}
