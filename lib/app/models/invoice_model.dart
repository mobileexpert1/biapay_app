// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'dart:convert';

List<InvoiceModel> invoiceModelFromJson(String str) => List<InvoiceModel>.from(json.decode(str).map((x) => InvoiceModel.fromJson(x)));

String invoiceModelToJson(List<InvoiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoiceModel {
  InvoiceModel({
    this.id,
    this.uuid,
    this.invoiceNo,
    this.orderNo,
    this.invoiceDate,
    this.dueDate,
    this.subTotal,
    this.taxTotal,
    this.discountTotal,
    this.total,
    this.currencyId,
    this.currencyCode,
    this.customerDto,
    this.merchantId,
    this.merchantName,
    this.shopId,
    this.shopName,
    this.merchantPosId,
    this.merchantPosName,
    this.invoiceItemDtoList,
  });

  int? id;
  String? uuid;
  String? invoiceNo;
  String? orderNo;
  String? invoiceDate;
  String? dueDate;
  double? subTotal;
  double? taxTotal;
  double? discountTotal;
  double? total;
  int? currencyId;
  String? currencyCode;
  CustomerDto? customerDto;
  int? merchantId;
  String? merchantName;
  int? shopId;
  String? shopName;
  int? merchantPosId;
  String? merchantPosName;
  List<InvoiceItemDtoList>? invoiceItemDtoList;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
    id: json["id"],
    uuid: json["uuid"],
    invoiceNo: json["invoiceNo"],
    orderNo: json["orderNo"],
    invoiceDate: json["invoiceDate"],
    dueDate: json["dueDate"],
    subTotal: json["subTotal"],
    taxTotal: json["taxTotal"].toDouble(),
    discountTotal: json["discountTotal"].toDouble(),
    total: json["total"].toDouble(),
    currencyId: json["currencyId"],
    currencyCode: json["currencyCode"],
    customerDto: CustomerDto.fromJson(json["customerDTO"]),
    merchantId: json["merchantId"],
    merchantName: json["merchantName"],
    shopId: json["shopId"],
    shopName: json["shopName"],
    merchantPosId: json["merchantPOSId"],
    merchantPosName: json["merchantPOSName"],
    invoiceItemDtoList: List<InvoiceItemDtoList>.from(json["invoiceItemDTOList"].map((x) => InvoiceItemDtoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "invoiceNo": invoiceNo,
    "orderNo": orderNo,
    "invoiceDate": invoiceDate,
    "dueDate": dueDate,
    "subTotal": subTotal,
    "taxTotal": taxTotal,
    "discountTotal": discountTotal,
    "total": total,
    "currencyId": currencyId,
    "currencyCode": currencyCode,
    "customerDTO": customerDto!.toJson(),
    "merchantId": merchantId,
    "merchantName": merchantName,
    "shopId": shopId,
    "shopName": shopName,
    "merchantPOSId": merchantPosId,
    "merchantPOSName": merchantPosName,
    "invoiceItemDTOList": List<dynamic>.from(invoiceItemDtoList!.map((x) => x.toJson())),
  };
}

class CustomerDto {
  CustomerDto({
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

  factory CustomerDto.fromJson(Map<String, dynamic> json) => CustomerDto(
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
    taxRate: json["taxRate"],
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

class InvoiceItemDtoList {
  InvoiceItemDtoList({
    this.id,
    this.name,
    this.description,
    this.quantity,
    this.price,
    this.discount,
    this.isDiscountPercentage,
    this.discountAmount,
    this.taxPercentage,
    this.shippingFee,
    this.subtotal,
    this.invoiceId,
    this.productId,
  });

  int? id;
  String? name;
  String? description;
  double? quantity;
  double? price;
  double? discount;
  bool? isDiscountPercentage;
  double? discountAmount;
  double? taxPercentage;
  double? shippingFee;
  double? subtotal;
  int? invoiceId;
  int? productId;

  factory InvoiceItemDtoList.fromJson(Map<String, dynamic> json) => InvoiceItemDtoList(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    quantity: json["quantity"],
    price: json["price"],
    discount: json["discount"].toDouble(),
    isDiscountPercentage: json["isDiscountPercentage"],
    discountAmount: json["discountAmount"].toDouble(),
    taxPercentage: json["taxPercentage"],
    shippingFee: json["shippingFee"],
    subtotal: json["subtotal"].toDouble(),
    invoiceId: json["invoiceId"],
    productId: json["productId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "quantity": quantity,
    "price": price,
    "discount": discount,
    "isDiscountPercentage": isDiscountPercentage,
    "discountAmount": discountAmount,
    "taxPercentage": taxPercentage,
    "shippingFee": shippingFee,
    "subtotal": subtotal,
    "invoiceId": invoiceId,
    "productId": productId,
  };
}
