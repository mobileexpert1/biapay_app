

import 'dart:convert';

AccessHistoryModel AccessHistoryModelFromJson(String str) =>
    AccessHistoryModel.fromJson(json.decode(str));

String AccessHistoryModelToJson(AccessHistoryModel data) =>
    json.encode(data.toJson());

class AccessHistoryModel {
  AccessHistoryModel({
    this.status,
    this.message,
    this.accessInfo,
  });

  String? status;
  String? message;
  List<AccessInfo>? accessInfo;

  factory AccessHistoryModel.fromJson(Map<String, dynamic> json) =>
      AccessHistoryModel(
        status: json["status"],
        message: json["message"],
        accessInfo: List<AccessInfo>.from(
            json["accessInfo"].map((x) => AccessInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "accessInfo":
            List<dynamic>.from(accessInfo!.map((x) => x.toJson())),
      };
}

class AccessInfo {
  AccessInfo({
    this.id,
    this.ipAddress,
    this.browser,
    this.date,
    this.userEmail,
  });

  int? id;
  String? ipAddress;
  String? browser;
  String? date;
  String? userEmail;

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        id: json["id"],
        ipAddress: json["ipAddress"],
        browser: json["browser"],
        date: json["date"].toString(),
        userEmail: json["userEmail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ipAddress": ipAddress,
        "browser": browser,
        "date": date,
        "userEmail": userEmail,
      };
}
