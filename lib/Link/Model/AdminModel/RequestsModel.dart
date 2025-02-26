class AllRequestsModel {
  List<Registration>? registration;

  AllRequestsModel({this.registration});

  AllRequestsModel.fromJson(Map<String, dynamic> json) {
    if (json['registration'] != null) {
      registration = <Registration>[];
      json['registration'].forEach((v) {
        registration!.add(Registration.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (registration != null) {
      data['registration'] = registration!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Registration {
  Guardian? guardian;
  Student? student;
  String? date;
  int? acceptanceNumber;
  String? type;

  Registration(
      {this.guardian,
      this.student,
      this.date,
      this.acceptanceNumber,
      this.type});

  Registration.fromJson(Map<String, dynamic> json) {
    guardian =
        json['guardian'] != null ? Guardian.fromJson(json['guardian']) : null;
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
    date = json['date'];
    acceptanceNumber = json['acceptanceNumber'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (guardian != null) {
      data['guardian'] = guardian!.toJson();
    }
    if (student != null) {
      data['student'] = student!.toJson();
    }
    data['date'] = date;
    data['acceptanceNumber'] = acceptanceNumber;
    data['type'] = type;
    return data;
  }
}

class Guardian {
  int? id;
  String? name;
  String? phone;
  String? nationalId;
  String? email;
  String? userName;

  Guardian(
      {this.id,
      this.name,
      this.phone,
      this.nationalId,
      this.email,
      this.userName});

  Guardian.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    email = json['email'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['nationalId'] = nationalId;
    data['email'] = email;
    data['userName'] = userName;
    return data;
  }
}

class Student {
  String? name;
  String? clas;
  String? previousClass;
  int? id;

  Student({this.name, this.clas, this.previousClass, this.id});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    clas = json['class'];
    previousClass = json['previousClass'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['class'] = clas;
    data['previousClass'] = previousClass;
    data['id'] = id;
    return data;
  }
}
