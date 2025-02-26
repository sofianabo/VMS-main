class Illness_Model {
  List<Illness>? illness;

  Illness_Model({this.illness});

  Illness_Model.fromJson(Map<String, dynamic> json) {
    if (json['illness'] != null) {
      illness = <Illness>[];
      json['illness'].forEach((v) {
        illness!.add(new Illness.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.illness != null) {
      data['illness'] = this.illness!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Illness {
  int? id;
  String? enName;
  String? name;
  int? chronic;

  Illness({this.id, this.enName, this.name, this.chronic});

  Illness.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enName = json['enName'];
    name = json['name'];
    chronic = json['chronic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enName'] = this.enName;
    data['name'] = this.name;
    data['chronic'] = this.chronic;
    return data;
  }
}
