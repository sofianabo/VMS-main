class PenaltiesAndRewardsStudentModel {
  List<PenaltyStudent>? penaltyStudent;

  PenaltiesAndRewardsStudentModel({this.penaltyStudent});

  PenaltiesAndRewardsStudentModel.fromJson(Map<String, dynamic> json) {
    if (json['penaltyStudent'] != null) {
      penaltyStudent = <PenaltyStudent>[];
      json['penaltyStudent'].forEach((v) {
        penaltyStudent!.add(new PenaltyStudent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.penaltyStudent != null) {
      data['penaltyStudent'] =
          this.penaltyStudent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PenaltyStudent {
  int? id;
  String? cause;
  String? startDate;
  String? endDate;
  List<Penalty>? penalty;

  PenaltyStudent(
      {this.id, this.cause, this.startDate, this.endDate, this.penalty});

  PenaltyStudent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cause = json['cause'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    if (json['penalty'] != null) {
      penalty = <Penalty>[];
      json['penalty'].forEach((v) {
        penalty!.add(new Penalty.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cause'] = this.cause;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    if (this.penalty != null) {
      data['penalty'] = this.penalty!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Penalty {
  int? id;
  String? name;
  String? enName;
  String? description;

  Penalty({this.id, this.name, this.enName, this.description});

  Penalty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['description'] = this.description;
    return data;
  }
}
