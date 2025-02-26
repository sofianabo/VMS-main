class Transaction_Model {
  List<Transaction>? transaction;

  Transaction_Model({this.transaction});

  Transaction_Model.fromJson(Map<String, dynamic> json) {
    if (json['transaction'] != null) {
      transaction = <Transaction>[];
      json['transaction'].forEach((v) {
        transaction!.add(Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (transaction != null) {
      data['transaction'] = transaction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transaction {
  String? ip;
  String? platform;
  String? browserVersion;
  String? deviceType;
  String? device;
  String? action;
  String? detail;
  String? arDetail;
  String? userName;
  String? roll;
  String? date;
  String? time;

  Transaction(
      {this.ip,
      this.platform,
      this.browserVersion,
      this.deviceType,
      this.device,
      this.action,
      this.detail,
      this.arDetail,
      this.userName,
      this.roll,
      this.date,
      this.time});

  Transaction.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    platform = json['platform'];
    browserVersion = json['browserVersion'];
    deviceType = json['deviceType'];
    device = json['device'];
    action = json['action'];
    detail = json['detail'];
    arDetail = json['arDetail'];
    userName = json['userName'];
    roll = json['roll'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ip'] = ip;
    data['platform'] = platform;
    data['browserVersion'] = browserVersion;
    data['deviceType'] = deviceType;
    data['device'] = device;
    data['action'] = action;
    data['detail'] = detail;
    data['arDetail'] = arDetail;
    data['userName'] = userName;
    data['roll'] = roll;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
