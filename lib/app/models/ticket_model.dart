class Ticket {
  int? id;
  String? ticketNo;
  String? title;
  String? content;
  String? priority;
  String? status;
  String? createdDateTime;
  CreatedUser? createdUser;
  List<Attachments>? attachments;
  List<Participants>? participants;

  Ticket(
      {this.id,
      this.ticketNo,
      this.title,
      this.content,
      this.priority,
      this.status,
      this.createdDateTime,
      this.createdUser,
      this.attachments,
      this.participants});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketNo = json['ticketNo'];
    title = json['title'];
    content = json['content'];
    priority = json['priority'];
    status = json['status'];
    createdDateTime = json['createdDateTime'];
    createdUser = json['createdUser'] != null
        ? new CreatedUser.fromJson(json['createdUser'])
        : null;
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }

    if (json['participants'] != null) {
      participants = <Participants>[];
      json['participants'].forEach((v) {
        participants!.add(new Participants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticketNo'] = this.ticketNo;
    data['title'] = this.title;
    data['content'] = this.content;
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['createdDateTime'] = this.createdDateTime;
    if (this.createdUser != null) {
      data['createdUser'] = this.createdUser!.toJson();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }

    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CreatedUser {
  int? userId;
  String? email;
  String? mobileNumber;
  int? failedLoginCount;
  String? userType;
  String? userStatus;
  bool? emailVerified;
  bool? twoFAEnabled;

  CreatedUser(
      {this.userId,
      this.email,
      this.mobileNumber,
      this.failedLoginCount,
      this.userType,
      this.userStatus,
      this.emailVerified,
      this.twoFAEnabled});

  CreatedUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    failedLoginCount = json['failedLoginCount'];
    userType = json['userType'];
    userStatus = json['userStatus'];

    emailVerified = json['emailVerified'];
    twoFAEnabled = json['twoFAEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['failedLoginCount'] = this.failedLoginCount;
    data['userType'] = this.userType;
    data['userStatus'] = this.userStatus;
    data['emailVerified'] = this.emailVerified;
    data['twoFAEnabled'] = this.twoFAEnabled;
    return data;
  }
}

class Attachments {
  int? id;
  String? fileName;
  int? fileSize;
  String? mimeType;
  String? uuid;
  String? originalName;
  String? uploadType;
  String? localPath;
  String? uploadedAt;
  CreatedUser? user;

  Attachments(
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

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
    fileSize = json['fileSize'];
    mimeType = json['mimeType'];
    uuid = json['uuid'];
    originalName = json['originalName'];
    uploadType = json['uploadType'];
    localPath = json['localPath'];
    uploadedAt = json['uploadedAt'];
    user = json['user'] != null ? new CreatedUser.fromJson(json['user']) : null;
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

class Participants {
  int? userId;
  String? email;
  String? mobileNumber;
  int? failedLoginCount;
  String? userType;
  String? userStatus;
  bool? emailVerified;
  bool? twoFAEnabled;

  Participants(
      {this.userId,
      this.email,
      this.mobileNumber,
      this.failedLoginCount,
      this.userType,
      this.userStatus,
      this.emailVerified,
      this.twoFAEnabled});

  Participants.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    failedLoginCount = json['failedLoginCount'];
    userType = json['userType'];
    userStatus = json['userStatus'];

    emailVerified = json['emailVerified'];
    twoFAEnabled = json['twoFAEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['failedLoginCount'] = this.failedLoginCount;
    data['userType'] = this.userType;
    data['userStatus'] = this.userStatus;
    data['emailVerified'] = this.emailVerified;
    data['twoFAEnabled'] = this.twoFAEnabled;
    return data;
  }
}
