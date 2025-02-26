class Vaccines_Model {
  List<Vaccine>? vaccine;

  Vaccines_Model({this.vaccine});

  Vaccines_Model.fromJson(Map<String, dynamic> json) {
    if (json['vaccine'] != null) {
      vaccine = <Vaccine>[];
      json['vaccine'].forEach((v) {
        vaccine!.add(new Vaccine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vaccine != null) {
      data['vaccine'] = this.vaccine!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vaccine {
  int? id;
  String? name;
  String? enName;
  Location? location;

  Vaccine({this.id, this.name, this.enName, this.location});

  Vaccine.fromJson(Map<String, dynamic> json) {
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
