class AllSessionModel {
  List<Sessions>? sessions;
  Sessions? current;

  AllSessionModel({this.sessions, this.current});

  AllSessionModel.fromJson(Map<String, dynamic> json) {
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(Sessions.fromJson(v));
      });
    }
    current =
    json['current'] != null ? Sessions.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sessions != null) {
      data['sessions'] = sessions!.map((v) => v.toJson()).toList();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    return data;
  }
}

class Sessions {
  int? id;
  String? year;
  String? status;
  String? startDate;
  String? endDate;
  int? hasStudent;

  Sessions(
      {this.id,
        this.year,
        this.status,
        this.startDate,
        this.endDate,
        this.hasStudent});

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    year = json['year'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    hasStudent = json['hasStudent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['year'] = year;
    data['status'] = status;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['hasStudent'] = hasStudent;
    return data;
  }
}
