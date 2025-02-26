class One_Employee_Model {
  Employee? employee;

  One_Employee_Model({this.employee});

  One_Employee_Model.fromJson(Map<String, dynamic> json) {
    employee = json['employee'] != null
        ? Employee.fromJson(json['employee'])
        : null;
  }
}

class Employee {
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
  String? email;
  String? userName;
  String? roll;
  int? salary;

  Employee(
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
        this.email,
        this.userName,
        this.roll,
        this.salary});

  Employee.fromJson(Map<String, dynamic> json) {
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
    email = json['email'];
    userName = json['userName'];
    roll = json['roll'];
    salary = json['salary'];
  }
}
