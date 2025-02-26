class Location_Model {
  List<Location>? location;

  Location_Model({this.location});

  Location_Model.fromJson(Map<String, dynamic> json) {
    if (json['Location'] != null) {
      location = <Location>[];
      json['Location'].forEach((v) {
        location!.add(Location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['Location'] = location!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['enName'] = enName;
    data['callSign'] = callSign;
    return data;
  }
}
