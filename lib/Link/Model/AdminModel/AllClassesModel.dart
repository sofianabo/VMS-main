class AllClassModel {
  List<Classes>? classes;

  AllClassModel({this.classes});

  AllClassModel.fromJson(Map<String, dynamic> json) {
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  int? id;
  String? driveUrl;
  String? name;
  String? enName;
  List<Curriculum>? curriculum;
  bool? hasStudent;
  Grade? grade;
  Session? session;
  Admin? admin;

  Classes(
      {this.id,
      this.driveUrl,
      this.name,
      this.enName,
      this.curriculum,
      this.hasStudent,
      this.grade,
      this.session,
      this.admin});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driveUrl = json['driveUrl'];
    name = json['name'];
    enName = json['enName'];
    if (json['curriculum'] != null) {
      curriculum = <Curriculum>[];
      json['curriculum'].forEach((v) {
        curriculum!.add(new Curriculum.fromJson(v));
      });
    }
    hasStudent = json['hasStudent'];
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    session =
        json['session'] != null ? new Session.fromJson(json['session']) : null;
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driveUrl'] = this.driveUrl;
    data['name'] = this.name;
    data['enName'] = this.enName;
    if (this.curriculum != null) {
      data['curriculum'] = this.curriculum!.map((v) => v.toJson()).toList();
    }
    data['hasStudent'] = this.hasStudent;
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    if (this.session != null) {
      data['session'] = this.session!.toJson();
    }
    if (this.admin != null) {
      data['admin'] = this.admin!.toJson();
    }
    return data;
  }
}

class Curriculum {
  int? id;
  String? name;
  String? enName;

  Curriculum({this.id, this.name, this.enName});

  Curriculum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}

class Grade {
  String? name;
  String? enName;

  Grade({this.name, this.enName});

  Grade.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}

class Session {
  String? year;

  Session({this.year});

  Session.fromJson(Map<String, dynamic> json) {
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    return data;
  }
}

class Admin {
  String? userName;

  Admin({this.userName});

  Admin.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    return data;
  }
}
