class AllTeacherModel {
  List<Teachers>? teachers;

  AllTeacherModel({this.teachers});

  AllTeacherModel.fromJson(Map<String, dynamic> json) {
    if (json['Teachers'] != null) {
      teachers = <Teachers>[];
      json['Teachers'].forEach((v) {
        teachers!.add(Teachers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teachers != null) {
      data['Teachers'] = teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teachers {
  int? id;
  String? contractType;
  String? gender;
  String? phone;
  int? imageId;
  String? jobTitle;
  String? fullName;
  int? hoursCount;
  List<Classes>? classes;
  List<Subject>? subject;
  bool? hasEmployee;
  String? email;

  Teachers(
      {this.id,
      this.contractType,
      this.gender,
      this.phone,
      this.imageId,
      this.jobTitle,
      this.fullName,
      this.hoursCount,
      this.classes,
      this.subject,
      this.hasEmployee,
      this.email});

  Teachers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractType = json['contractType'];
    gender = json['gender'];
    phone = json['phone'];
    imageId = json['imageId'];
    jobTitle = json['jobTitle'];
    fullName = json['fullName'];
    hoursCount = json['hoursCount'];
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
    hasEmployee = json['hasEmployee'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contractType'] = contractType;
    data['gender'] = gender;
    data['phone'] = phone;
    data['imageId'] = imageId;
    data['jobTitle'] = jobTitle;
    data['fullName'] = fullName;
    data['hoursCount'] = hoursCount;
    if (classes != null) {
      data['classes'] = classes!.map((v) => v.toJson()).toList();
    }
    if (subject != null) {
      data['subject'] = subject!.map((v) => v.toJson()).toList();
    }
    data['hasEmployee'] = hasEmployee;
    data['email'] = email;
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
