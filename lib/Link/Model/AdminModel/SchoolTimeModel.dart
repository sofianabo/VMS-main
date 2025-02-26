class SchoolTimeModel {
  List<StudyShare>? studyShare;

  SchoolTimeModel({this.studyShare});

  SchoolTimeModel.fromJson(Map<String, dynamic> json) {
    if (json['studyShare'] != null) {
      studyShare = <StudyShare>[];
      json['studyShare'].forEach((v) {
        studyShare!.add(new StudyShare.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studyShare != null) {
      data['studyShare'] = this.studyShare!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudyShare {
  String? name;
  String? enName;
  String? day;
  int? id;
  String? permanentType;
  int? lessonId;
  String? fullName;

  StudyShare(
      {this.name,
      this.enName,
      this.day,
      this.id,
      this.permanentType,
      this.lessonId,
      this.fullName});

  StudyShare.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
    day = json['day'];
    id = json['id'];
    permanentType = json['permanentType'];
    lessonId = json['lessonId'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['day'] = this.day;
    data['id'] = this.id;
    data['permanentType'] = this.permanentType;
    data['lessonId'] = this.lessonId;
    data['fullName'] = this.fullName;
    return data;
  }

  @override
  String toString() {
    String s = "";
    if (true) {
      //language
      s += "${enName} \n";
      s += "${fullName} \n";
    } else {
      //arbic
      s += "${name} \n";
      s += "${fullName} \n";
    }
    return s;
  }
}





