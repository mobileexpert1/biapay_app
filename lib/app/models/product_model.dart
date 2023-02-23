// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.tax,
    this.isTaxPercentage,
    this.salePrice,
    this.purchasePrice,
    this.category,
    this.currencyId,
    this.merchantId,
    this.uploads,
    this.isListedInStore,
  });

  int? id;
  String? name;
  String? description;
  double? tax;
  bool? isTaxPercentage;
  double? salePrice;
  double? purchasePrice;
  String? category;
  int? currencyId;
  int? merchantId;
  List<dynamic>? uploads;
  bool? isListedInStore;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    tax: json["tax"],
    isTaxPercentage: json["isTaxPercentage"],
    salePrice: json["salePrice"],
    purchasePrice: json["purchasePrice"],
    category: json["category"],
    currencyId: json["currencyId"],
    merchantId: json["merchantId"],
    uploads: List<dynamic>.from(json["uploads"].map((x) => x)),
    isListedInStore: json["isListedInStore"] == null ? null : json["isListedInStore"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "tax": tax,
    "isTaxPercentage": isTaxPercentage,
    "salePrice": salePrice,
    "purchasePrice": purchasePrice,
    "category": category,
    "currencyId": currencyId,
    "merchantId": merchantId,
    "uploads": List<dynamic>.from(uploads!.map((x) => x)),
    "isListedInStore": isListedInStore == null ? null : isListedInStore,
  };
}
