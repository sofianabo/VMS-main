class AllGuardianModel {
  List<Gaurdians>? gaurdians;

  AllGuardianModel({this.gaurdians});

  AllGuardianModel.fromJson(Map<String, dynamic> json) {
    if (json['gaurdians'] != null) {
      gaurdians = <Gaurdians>[];
      json['gaurdians'].forEach((v) {
        gaurdians!.add(Gaurdians.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (gaurdians != null) {
      data['gaurdians'] = gaurdians!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gaurdians {
  int? id;
  String? name;
  String? phone;
  String? nationalId;
  String? email;
  String? userName;

  Gaurdians(
      {this.id,
      this.name,
      this.phone,
      this.nationalId,
      this.email,
      this.userName});

  Gaurdians.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    email = json['email'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['nationalId'] = nationalId;
    data['email'] = email;
    data['userName'] = userName;
    return data;
  }
}
