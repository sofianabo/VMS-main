class Students_Vaccines_Model {
  List<Vaccineses>? vaccineses;

  Students_Vaccines_Model({this.vaccineses});

  Students_Vaccines_Model.fromJson(Map<String, dynamic> json) {
    if (json['vaccineses'] != null) {
      vaccineses = <Vaccineses>[];
      json['vaccineses'].forEach((v) {
        vaccineses!.add(new Vaccineses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vaccineses != null) {
      data['vaccineses'] = this.vaccineses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vaccineses {
  int? studentId;
  int? fileId;
  Vaccines? vaccines;

  Vaccineses({this.studentId, this.fileId, this.vaccines});

  Vaccineses.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    fileId = json['fileId'];
    vaccines = json['vaccines'] != null
        ? new Vaccines.fromJson(json['vaccines'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['fileId'] = this.fileId;
    if (this.vaccines != null) {
      data['vaccines'] = this.vaccines!.toJson();
    }
    return data;
  }
}

class Vaccines {
  int? id;
  String? name;
  String? enName;
  Location? location;

  Vaccines({this.id, this.name, this.enName, this.location});

  Vaccines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  int? id;
  String? name;
  String? enName;
  String? callSign;

  Location({this.id, this.name, this.enName, this.callSign});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    callSign = json['callSign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['callSign'] = this.callSign;
    return data;
  }
}
