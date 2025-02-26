

class HomeModel {
    int? student;
    int? teacher;
    int? visitors;

    HomeModel({this.student, this.teacher, this.visitors});

    HomeModel.fromJson(Map<String, dynamic> json) {
        student = json["student"];
        teacher = json["teacher"];
        visitors = json["visitors"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["student"] = student;
        data["teacher"] = teacher;
        data["visitors"] = visitors;
        return data;
    }
}
