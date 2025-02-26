class Labrary_Model {
  List<Books>? books;

  Labrary_Model({this.books});

  Labrary_Model.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (books != null) {
      data['books'] = books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  int? id;
  int? fileId;
  String? name;
  String? enName;

  Books({this.id, this.fileId, this.name, this.enName});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['fileId'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fileId'] = fileId;
    data['name'] = name;
    data['enName'] = enName;
    return data;
  }
}
