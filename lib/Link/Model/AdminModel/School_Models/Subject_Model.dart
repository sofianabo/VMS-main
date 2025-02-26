class Subject_Model {
  List<Subject>? subject;

  Subject_Model({this.subject});

  Subject_Model.fromJson(Map<String, dynamic> json) {
    if (json['subject'] != null) {
      subject = <Subject>[];
      json['subject'].forEach((v) {
        subject!.add(Subject.fromJson(v));
      });
    }
  }
}

class Subject {
  int? id;
  String? name;
  String? enName;
  bool? hasCurriculum;

  Subject({this.id, this.name, this.enName, this.hasCurriculum});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    hasCurriculum = json['hasCurriculum'];
  }
}
