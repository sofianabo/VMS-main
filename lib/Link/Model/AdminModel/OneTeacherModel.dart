class Oneteachermodel {
  TeacherById? teacher;

  Oneteachermodel({this.teacher});

  Oneteachermodel.fromJson(Map<String, dynamic> json) {
    teacher = json['Teacher'] != null
        ? TeacherById.fromJson(json['Teacher'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teacher != null) {
      data['Teacher'] = teacher!.toJson();
    }
    return data;
  }
}

class TeacherById {
  int? id;
  int? imageId;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? gender;
  String? birthDate;
  String? joinDate;
  String? phone;
  String? emergencyNumber;
  String? familystatus;
  String? currentAddress;
  String? address;
  String? qualification;
  String? experience;
  String? note;
  String? contractType;
  String? bankAccountTitle;
  String? bankName;
  String? bankBranchName;
  String? bankAccountNumber;
  String? iFSCCode;
  String? facebookUrl;
  String? twitterUrl;
  String? lenkedinUrl;
  String? instagramUrl;
  String? careerHistory;
  String? jobTitle;
  int? salary;
  String? email;
  String? userName;
  String? roll;

  TeacherById(
      {this.id,
      this.imageId,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.motherName,
      this.gender,
      this.birthDate,
      this.joinDate,
      this.phone,
      this.emergencyNumber,
      this.familystatus,
      this.currentAddress,
      this.address,
      this.qualification,
      this.experience,
      this.note,
      this.contractType,
      this.bankAccountTitle,
      this.bankName,
      this.bankBranchName,
      this.bankAccountNumber,
      this.iFSCCode,
      this.facebookUrl,
      this.twitterUrl,
      this.lenkedinUrl,
      this.instagramUrl,
      this.careerHistory,
      this.jobTitle,
      this.salary,
      this.email,
      this.userName,
      this.roll});

  TeacherById.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['imageId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fatherName = json['fatherName'];
    motherName = json['motherName'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    joinDate = json['joinDate'];
    phone = json['phone'];
    emergencyNumber = json['emergencyNumber'];
    familystatus = json['familystatus'];
    currentAddress = json['currentAddress'];
    address = json['address'];
    qualification = json['qualification'];
    experience = json['experience'];
    note = json['note'];
    contractType = json['contractType'];
    bankAccountTitle = json['bankAccountTitle'];
    bankName = json['bankName'];
    bankBranchName = json['bankBranchName'];
    bankAccountNumber = json['bankAccountNumber'];
    iFSCCode = json['IFSCCode'];
    facebookUrl = json['facebookUrl'];
    twitterUrl = json['twitterUrl'];
    lenkedinUrl = json['lenkedinUrl'];
    instagramUrl = json['instagramUrl'];
    careerHistory = json['careerHistory'];
    jobTitle = json['jobTitle'];
    salary = json['salary'];
    email = json['email'];
    userName = json['userName'];
    roll = json['roll'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageId'] = imageId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fatherName'] = fatherName;
    data['motherName'] = motherName;
    data['gender'] = gender;
    data['birthDate'] = birthDate;
    data['joinDate'] = joinDate;
    data['phone'] = phone;
    data['emergencyNumber'] = emergencyNumber;
    data['familystatus'] = familystatus;
    data['currentAddress'] = currentAddress;
    data['address'] = address;
    data['qualification'] = qualification;
    data['experience'] = experience;
    data['note'] = note;
    data['contractType'] = contractType;
    data['bankAccountTitle'] = bankAccountTitle;
    data['bankName'] = bankName;
    data['bankBranchName'] = bankBranchName;
    data['bankAccountNumber'] = bankAccountNumber;
    data['IFSCCode'] = iFSCCode;
    data['facebookUrl'] = facebookUrl;
    data['twitterUrl'] = twitterUrl;
    data['lenkedinUrl'] = lenkedinUrl;
    data['instagramUrl'] = instagramUrl;
    data['careerHistory'] = careerHistory;
    data['jobTitle'] = jobTitle;
    data['salary'] = salary;
    data['email'] = email;
    data['userName'] = userName;
    data['roll'] = roll;
    return data;
  }
}
