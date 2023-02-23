// To parse this JSON data, do
//
//     final shopModel = shopModelFromJson(jsonString);

import 'dart:convert';

ShopModel shopModelFromJson(String str) => ShopModel.fromJson(json.decode(str));

String shopModelToJson(ShopModel data) => json.encode(data.toJson());

class ShopModel {
  ShopModel({
    this.status,
    this.message,
    this.shops,
  });

  String? status;
  String? message;
  List<Shop>? shops;

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
    status: json["status"],
    message: json["message"],
    shops: List<Shop>.from(json["shops"].map((x) => Shop.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "shops": List<dynamic>.from(shops!.map((x) => x.toJson())),
  };
}

class Shop {
  Shop({
    this.shopId,
    this.name,
    this.status,
    this.merchantPosList,
  });

  int? shopId;
  String? name;
  bool? status;
  List<MerchantPosList>? merchantPosList;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    shopId: json["shopId"],
    name: json["name"],
    status: json["status"],
    merchantPosList: List<MerchantPosList>.from(json["merchantPOSList"].map((x) => MerchantPosList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "shopId": shopId,
    "name": name,
    "status": status,
    "merchantPOSList": List<dynamic>.from(merchantPosList!.map((x) => x.toJson())),
  };
}

class MerchantPosList {
  MerchantPosList({
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

  factory MerchantPosList.fromJson(Map<String, dynamic> json) => MerchantPosList(
    id: json["id"],
    shopId: json["shopId"],
    callbackUrl: json["callbackUrl"] == null ? null : json["callbackUrl"],
    name: json["name"],
    status: json["status"],
    isDefault: json["isDefault"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shopId": shopId,
    "callbackUrl": callbackUrl == null ? null : callbackUrl,
    "name": name,
    "status": status,
    "isDefault": isDefault,
    "uuid": uuid,
  };
}
