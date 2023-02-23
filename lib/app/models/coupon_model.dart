// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

List<CouponModel> couponModelFromJson(String str) => List<CouponModel>.from(json.decode(str).map((x) => CouponModel.fromJson(x)));

String couponModelToJson(List<CouponModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CouponModel {
  CouponModel({
    this.id,
    this.name,
    this.couponType,
    this.couponStatus,
    this.amount,
    this.startDate,
    this.endDate,
    this.maxUsage,
    this.currentUsage,
    this.merchantId,
  });

  int? id;
  String? name;
  String? couponType;
  String? couponStatus;
  double? amount;
  String? startDate;
  String? endDate;
  int? maxUsage;
  int? currentUsage;
  int? merchantId;

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
    id: json["id"],
    name: json["name"],
    couponType: json["couponType"],
    couponStatus: json["couponStatus"],
    amount: json["amount"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    maxUsage: json["maxUsage"],
    currentUsage: json["currentUsage"] == null ? null : json["currentUsage"],
    merchantId: json["merchantId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "couponType": couponType,
    "couponStatus": couponStatus,
    "amount": amount,
    "startDate": startDate,
    "endDate": endDate,
    "maxUsage": maxUsage,
    "currentUsage": currentUsage == null ? null : currentUsage,
    "merchantId": merchantId,
  };
}
