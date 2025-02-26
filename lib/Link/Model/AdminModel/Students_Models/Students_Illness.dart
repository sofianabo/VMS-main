class Students_Illness {
  List<Illnesses>? illnesses;

  Students_Illness({this.illnesses});

  Students_Illness.fromJson(Map<String, dynamic> json) {
    if (json['illnesses'] != null) {
      illnesses = <Illnesses>[];
      json['illnesses'].forEach((v) {
        illnesses!.add(new Illnesses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.illnesses != null) {
      data['illnesses'] = this.illnesses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Illnesses {
  int? fileId;
  Illness? illness;

  Illnesses({this.fileId, this.illness});

  Illnesses.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    illness =
        json['illness'] != null ? new Illness.fromJson(json['illness']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileId'] = this.fileId;
    if (this.illness != null) {
      data['illness'] = this.illness!.toJson();
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
