class Student_Info_model {
  Student? student;

  Student_Info_model({this.student});

  Student_Info_model.fromJson(Map<String, dynamic> json) {
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
  }
}

class Student {
  int? id;
  int? acceptanceNumber;
  String? currentSession;
  String? firstName;
  String? lastName;
  String? gender;
  String? birthDate;
  String? placeOfBirth;
  String? religion;
  String? mobileNumber;
  String? bloodType;
  String? feeDiscount;
  String? fatherName;
  String? fatherPhone;
  String? fatherWork;
  String? motherName;
  String? motherPhone;
  String? motherWork;
  String? currentAdress;
  String? nationalNumber;
  String? localID;
  String? lastSchoolDetail;
  String? note;
  String? familystatus;
  int? specialNeeds;
  int? martyrSon;
  int? fileId;
  bool? isPended;
  String? email;
  Division? division;
  Division? location;
  Division? classes;
  Division? grade;
  Guardians? guardians;
  String? userName;
  Documantes? documantes;

  Student(
      {this.id,
      this.acceptanceNumber,
      this.currentSession,
      this.firstName,
      this.lastName,
      this.gender,
      this.birthDate,
      this.placeOfBirth,
      this.religion,
      this.mobileNumber,
      this.bloodType,
      this.feeDiscount,
      this.fatherName,
      this.fatherPhone,
      this.fatherWork,
      this.motherName,
      this.motherPhone,
      this.motherWork,
      this.currentAdress,
      this.nationalNumber,
      this.localID,
      this.lastSchoolDetail,
      this.note,
      this.familystatus,
      this.specialNeeds,
      this.martyrSon,
      this.fileId,
      this.isPended,
      this.email,
      this.division,
      this.location,
      this.classes,
      this.grade,
      this.guardians,
      this.userName,
      this.documantes});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acceptanceNumber = json['acceptanceNumber'];
    currentSession = json['currentSession'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    placeOfBirth = json['placeOfBirth'];
    religion = json['religion'];
    mobileNumber = json['mobileNumber'];
    bloodType = json['bloodType'];
    feeDiscount = json['feeDiscount'];
    fatherName = json['fatherName'];
    fatherPhone = json['fatherPhone'];
    fatherWork = json['fatherWork'];
    motherName = json['motherName'];
    motherPhone = json['motherPhone'];
    motherWork = json['motherWork'];
    currentAdress = json['currentAdress'];
    nationalNumber = json['nationalNumber'];
    localID = json['localID'];
    lastSchoolDetail = json['lastSchoolDetail'];
    note = json['note'];
    familystatus = json['familystatus'];
    specialNeeds = json['specialNeeds'];
    martyrSon = json['martyrSon'];
    fileId = json['fileId'];
    isPended = json['isPended'];
    email = json['email'];
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    location = json['location'] != null
        ? new Division.fromJson(json['location'])
        : null;
    classes =
        json['classes'] != null ? new Division.fromJson(json['classes']) : null;
    grade = json['grade'] != null ? new Division.fromJson(json['grade']) : null;
    guardians = json['guardians'] != null
        ? new Guardians.fromJson(json['guardians'])
        : null;
    userName = json['userName'];
    documantes = json['documantes'] != null
        ? new Documantes.fromJson(json['documantes'])
        : null;
  }
}

class Division {
  String? name;
  String? enName;

  Division({this.name, this.enName});

  Division.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['EnName'];
  }
}

class Guardians {
  int? id;
  String? name;
  String? phone;
  String? nationalId;
  String? email;
  String? userName;

  Guardians(
      {this.id,
      this.name,
      this.phone,
      this.nationalId,
      this.email,
      this.userName});

  Guardians.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    email = json['email'];
    userName = json['userName'];
  }
}

class Documantes {
  FatherPassport? fatherPassport;
  FatherPassport? motherPassport;
  FatherPassport? sonPassport;
  FatherPassport? userID;
  FatherPassport? certificate;
  FatherPassport? academicSequence;
  FatherPassport? familyNotebook;

  Documantes({
    this.fatherPassport,
    this.motherPassport,
    this.sonPassport,
    this.userID,
    this.certificate,
    this.academicSequence,
    this.familyNotebook,
  });

  Documantes.fromJson(Map<String, dynamic> json) {
    fatherPassport = json['FatherPassport'] != null
        ? FatherPassport.fromJson(json['FatherPassport'])
        : null;
    motherPassport = json['MotherPassport'] != null
        ? FatherPassport.fromJson(json['MotherPassport'])
        : null;
    sonPassport = json['SonPassport'] != null
        ? FatherPassport.fromJson(json['SonPassport'])
        : null;
    userID =
        json['UserID'] != null ? FatherPassport.fromJson(json['UserID']) : null;
    certificate = json['Certificate'] != null
        ? FatherPassport.fromJson(json['Certificate'])
        : null;
    academicSequence = json['AcademicSequence'] != null
        ? FatherPassport.fromJson(json['AcademicSequence'])
        : null;
    familyNotebook = json['Family Notebook'] != null
        ? FatherPassport.fromJson(json['Family Notebook']) // التعديل هنا
        : null;
  }
}

class FatherPassport {
  int? id;
  String? fileType;

  FatherPassport({this.id, this.fileType});

  FatherPassport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileType = json['fileType'];
  }
}
