class ExamTableModel {
  List<Quiz>? quiz;

  ExamTableModel({this.quiz});

  ExamTableModel.fromJson(Map<String, dynamic> json) {
    if (json['quiz'] != null) {
      quiz = <Quiz>[];
      json['quiz'].forEach((v) {
        quiz!.add(new Quiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quiz != null) {
      data['quiz'] = this.quiz!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quiz {
  int? id;
  String? startDate;
  String? period;
  Null? name;
  int? maxMark;
  int? passingMark;
  Classese? classese;
  String? type;
  Classese? semester;
  String? curriculumName;
  String? curriculumEnName;

  Quiz(
      {this.id,
      this.startDate,
      this.period,
      this.name,
      this.maxMark,
      this.passingMark,
      this.classese,
      this.type,
      this.semester,
      this.curriculumName,
      this.curriculumEnName});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    period = json['period'];
    name = json['name'];
    maxMark = json['maxMark'];
    passingMark = json['PassingMark'];
    classese =
        json['classes'] != null ? new Classese.fromJson(json['classes']) : null;
    type = json['Type'];
    semester = json['semester'] != null
        ? new Classese.fromJson(json['semester'])
        : null;
    curriculumName = json['curriculumName'];
    curriculumEnName = json['curriculumEnName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['period'] = this.period;
    data['name'] = this.name;
    data['maxMark'] = this.maxMark;
    data['PassingMark'] = this.passingMark;
    if (this.classese != null) {
      data['classes'] = this.classese!.toJson();
    }
    data['Type'] = this.type;
    if (this.semester != null) {
      data['semester'] = this.semester!.toJson();
    }
    data['curriculumName'] = this.curriculumName;
    data['curriculumEnName'] = this.curriculumEnName;
    return data;
  }
}

class Classese {
  String? name;
  String? enName;
  int? id;

  Classese({this.name, this.enName, this.id});

  Classese.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['id'] = this.id;
    return data;
  }
}
