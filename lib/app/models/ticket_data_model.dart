class TicketDataModel {
  int? id;
  String? fileName;
  int? fileSize;
  String? mimeType;
  String? uuid;
  String? originalName;
  String? uploadType;
  String? localPath;
  String? uploadedAt;
  User? user;

  TicketDataModel(
      {this.id,
        this.fileName,
        this.fileSize,
        this.mimeType,
        this.uuid,
        this.originalName,
        this.uploadType,
        this.localPath,
        this.uploadedAt,
        this.user});

  TicketDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
    fileSize = json['fileSize'];
    mimeType = json['mimeType'];
    uuid = json['uuid'];
    originalName = json['originalName'];
    uploadType = json['uploadType'];
    localPath = json['localPath'];
    uploadedAt = json['uploadedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileName'] = this.fileName;
    data['fileSize'] = this.fileSize;
    data['mimeType'] = this.mimeType;
    data['uuid'] = this.uuid;
    data['originalName'] = this.originalName;
    data['uploadType'] = this.uploadType;
    data['localPath'] = this.localPath;
    data['uploadedAt'] = this.uploadedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? userId;
  String? email;
  var name;
  String? mobileNumber;
  var username;
  int? failedLoginCount;
  var lastSuccessLoginAt;
  var mfaStatus;
  String? userType;
  String? userStatus;
  var kycStatus;
  //List<Null>? merchantShops;
 // List<Null>? merchantPOSs;
  bool? emailVerified;
  bool? twoFAEnabled;

  User(
      {this.userId,
        this.email,
        this.name,
        this.mobileNumber,
        this.username,
        this.failedLoginCount,
        this.lastSuccessLoginAt,
        this.mfaStatus,
        this.userType,
        this.userStatus,
        this.kycStatus,
       // this.merchantShops,
       // this.merchantPOSs,
        this.emailVerified,
        this.twoFAEnabled});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    username = json['username'];
    failedLoginCount = json['failedLoginCount'];
    lastSuccessLoginAt = json['lastSuccessLoginAt'];
    mfaStatus = json['mfaStatus'];
    userType = json['userType'];
    userStatus = json['userStatus'];
    kycStatus = json['kycStatus'];
    /*if (json['merchantShops'] != null) {
      merchantShops = <Null>[];
      json['merchantShops'].forEach((v) {
        merchantShops!.add(new Null.fromJson(v));
      });
    }
    if (json['merchantPOSs'] != null) {
      merchantPOSs = <Null>[];
      json['merchantPOSs'].forEach((v) {
        merchantPOSs!.add(new Null.fromJson(v));
      });
    }*/
    emailVerified = json['emailVerified'];
    twoFAEnabled = json['twoFAEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['mobileNumber'] = this.mobileNumber;
    data['username'] = this.username;
    data['failedLoginCount'] = this.failedLoginCount;
    data['lastSuccessLoginAt'] = this.lastSuccessLoginAt;
    data['mfaStatus'] = this.mfaStatus;
    data['userType'] = this.userType;
    data['userStatus'] = this.userStatus;
    data['kycStatus'] = this.kycStatus;
   /* if (this.merchantShops != null) {
      data['merchantShops'] =
          this.merchantShops!.map((v) => v.toJson()).toList();
    }
    if (this.merchantPOSs != null) {
      data['merchantPOSs'] = this.merchantPOSs!.map((v) => v.toJson()).toList();
    }*/
    data['emailVerified'] = this.emailVerified;
    data['twoFAEnabled'] = this.twoFAEnabled;
    return data;
  }
}


