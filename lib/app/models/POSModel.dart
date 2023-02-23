// To parse this JSON data, do
//
//     final posModel = posModelFromJson(jsonString);

import 'dart:convert';

PosModel posModelFromJson(String str) => PosModel.fromJson(json.decode(str));

String posModelToJson(PosModel data) => json.encode(data.toJson());

class PosModel {
  PosModel({
    this.status,
    this.message,
    this.posMerchants,
  });

  String? status;
  String? message;
  List<PosMerchant>? posMerchants;

  factory PosModel.fromJson(Map<String, dynamic> json) => PosModel(
    status: json["status"],
    message: json["message"],
    posMerchants: List<PosMerchant>.from(json["posMerchants"].map((x) => PosMerchant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "posMerchants": List<dynamic>.from(posMerchants!.map((x) => x.toJson())),
  };
}

class PosMerchant {
  PosMerchant({
    this.id,
    this.shopId,
    this.callbackUrl,
    this.name,
    this.status,
    this.isDefault,
    this.uuid,
  });

  int? id;
  int? shopId;
  String? callbackUrl;
  String? name;
  bool? status;
  bool? isDefault;
  String? uuid;

  factory PosMerchant.fromJson(Map<String, dynamic> json) => PosMerchant(
    id: json["id"],
    shopId: json["shopId"],
    callbackUrl: json["callbackUrl"],
    name: json["name"],
    status: json["status"],
    isDefault: json["isDefault"],
    uuid: json["uuid"] == null ? null : json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shopId": shopId,
    "callbackUrl": callbackUrl,
    "name": name,
    "status": status,
    "isDefault": isDefault,
    "uuid": uuid == null ? null : uuid,
  };
}


/*
class PosModel {
  PosModel({
    this.id,
    this.shopId,
    this.name,
    this.status,
    this.callbackUrl,
    this.isDefault,
    this.uuid,
  });

  int? id;
  int? shopId;
  String? name;
  bool? status;
  String? callbackUrl;
  bool? isDefault;
  String? uuid;

  factory PosModel.fromJson(Map<String, dynamic> json) => PosModel(
    id: json["id"],
    shopId: json["shopId"],
    name: json["name"],
    status: json["status"] == null ? null : json["status"],
    callbackUrl: json["callbackUrl"] == null ? null : json["callbackUrl"],
    isDefault: json["isDefault"] == null ? null : json["isDefault"],
    uuid: json["uuid"] == null ? null : json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shopId": shopId,
    "name": name,
    "status": status == null ? null : status,
    "callbackUrl": callbackUrl == null ? null : callbackUrl,
    "isDefault": isDefault == null ? null : isDefault,
    "uuid": uuid == null ? null : uuid,
  };
}
*/