// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

List<CustomerModel> customerModelFromJson(String str) => List<CustomerModel>.from(json.decode(str).map((x) => CustomerModel.fromJson(x)));

String customerModelToJson(List<CustomerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerModel {
  CustomerModel({
    this.id,
    this.firstName,
    this.lastName,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phoneNumber,
    this.reference,
    this.website,
    this.taxRate,
    this.currencyId,
    this.merchantId,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? email;
  String? phoneNumber;
  String? reference;
  String? website;
  double? taxRate;
  int? currencyId;
  int? merchantId;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    addressLine1: json["addressLine1"],
    addressLine2: json["addressLine2"],
    city: json["city"],
    state: json["state"],
    postcode: json["postcode"],
    country: json["country"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    reference: json["reference"],
    website: json["website"],
    taxRate: json["taxRate"].toDouble(),
    currencyId: json["currencyId"],
    merchantId: json["merchantId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "addressLine1": addressLine1,
    "addressLine2": addressLine2,
    "city": city,
    "state": state,
    "postcode": postcode,
    "country": country,
    "email": email,
    "phoneNumber": phoneNumber,
    "reference": reference,
    "website": website,
    "taxRate": taxRate,
    "currencyId": currencyId,
    "merchantId": merchantId,
  };
}
