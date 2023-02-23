// To parse this JSON data, do
//
//     final pricingFeaturedModel = pricingFeaturedModelFromJson(jsonString);

import 'dart:convert';

PricingFeaturedModel pricingFeaturedModelFromJson(String str) => PricingFeaturedModel.fromJson(json.decode(str));

String pricingFeaturedModelToJson(PricingFeaturedModel data) => json.encode(data.toJson());

class PricingFeaturedModel {
  PricingFeaturedModel({
    this.status,
    this.message,
    this.subscriptionPlanList,
  });

  String? status;
  String? message;
  List<SubscriptionPlanList>? subscriptionPlanList;

  factory PricingFeaturedModel.fromJson(Map<String, dynamic> json) => PricingFeaturedModel(
    status: json["status"],
    message: json["message"],
    subscriptionPlanList: List<SubscriptionPlanList>.from(json["subscriptionPlanList"].map((x) => SubscriptionPlanList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "subscriptionPlanList": List<dynamic>.from(subscriptionPlanList!.map((x) => x.toJson())),
  };
}

class SubscriptionPlanList {
  SubscriptionPlanList({
    this.id,
    this.subscriptionName,
    this.subscriptionAmount,
    this.subscriptionDays,
    this.subscriptionStatus,
    this.typeofChannels,
    this.numberofTransaction,
    this.settlementPeriod,
    this.invoicePeriod,
    this.paymentMethodsSet,
    this.typeofPayment,
    this.shoppingcardAllowance,
    this.ancillariesAllowance,
    this.paymaillinkRequest,
    this.downgradeAllowable,
    this.invoicePayment,
    this.eventManagement,
    this.shoppingCart,
    this.defaultPlan,
    this.featured,
    this.flag,
    this.typeofIntegration,
    this.currencies,
    this.planType,
    this.maxSubUsers,
    this.maxShops,
    this.maxPosPerShop,
    this.maxListedProducts,
    this.maxPublishedEvents,
    this.transactionLimits,
  });

  int? id;
  String? subscriptionName;
  double? subscriptionAmount;
  int? subscriptionDays;
  bool? subscriptionStatus;
  String? typeofChannels;
  int? numberofTransaction;
  String? settlementPeriod;
  String? invoicePeriod;
  List<PaymentMethodsSet>? paymentMethodsSet;
  String? typeofPayment;
  bool? shoppingcardAllowance;
  bool? ancillariesAllowance;
  bool? paymaillinkRequest;
  bool? downgradeAllowable;
  bool? invoicePayment;
  bool? eventManagement;
  bool? shoppingCart;
  bool? defaultPlan;
  bool? featured;
  bool? flag;
  String? typeofIntegration;
  List<Currency>? currencies;
  String? planType;
  int? maxSubUsers;
  int? maxShops;
  int? maxPosPerShop;
  int? maxListedProducts;
  int? maxPublishedEvents;
  List<dynamic>? transactionLimits;

  factory SubscriptionPlanList.fromJson(Map<String, dynamic> json) => SubscriptionPlanList(
    id: json["id"],
    subscriptionName: json["subscriptionName"],
    subscriptionAmount: json["subscriptionAmount"],
    subscriptionDays: json["subscriptionDays"],
    subscriptionStatus: json["subscriptionStatus"],
    typeofChannels: json["typeofChannels"],
    numberofTransaction: json["numberofTransaction"],
    settlementPeriod: json["settlementPeriod"],
    invoicePeriod: json["invoicePeriod"],
    paymentMethodsSet: List<PaymentMethodsSet>.from(json["paymentMethodsSet"].map((x) => PaymentMethodsSet.fromJson(x))),
    typeofPayment: json["typeofPayment"],
    shoppingcardAllowance: json["shoppingcardAllowance"],
    ancillariesAllowance: json["ancillariesAllowance"],
    paymaillinkRequest: json["paymaillinkRequest"],
    downgradeAllowable: json["downgradeAllowable"],
    invoicePayment: json["invoicePayment"],
    eventManagement: json["eventManagement"],
    shoppingCart: json["shoppingCart"],
    defaultPlan: json["defaultPlan"],
    featured: json["featured"],
    flag: json["flag"],
    typeofIntegration: json["typeofIntegration"],
    currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
    planType: json["planType"],
    maxSubUsers: json["maxSubUsers"],
    maxShops: json["maxShops"],
    maxPosPerShop: json["maxPOSPerShop"],
    maxListedProducts: json["maxListedProducts"],
    maxPublishedEvents: json["maxPublishedEvents"],
    transactionLimits: List<dynamic>.from(json["transactionLimits"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subscriptionName": subscriptionName,
    "subscriptionAmount": subscriptionAmount,
    "subscriptionDays": subscriptionDays,
    "subscriptionStatus": subscriptionStatus,
    "typeofChannels": typeofChannels,
    "numberofTransaction": numberofTransaction,
    "settlementPeriod": settlementPeriod,
    "invoicePeriod": invoicePeriod,
    "paymentMethodsSet": List<dynamic>.from(paymentMethodsSet!.map((x) => x.toJson())),
    "typeofPayment": typeofPayment,
    "shoppingcardAllowance": shoppingcardAllowance,
    "ancillariesAllowance": ancillariesAllowance,
    "paymaillinkRequest": paymaillinkRequest,
    "downgradeAllowable": downgradeAllowable,
    "invoicePayment": invoicePayment,
    "eventManagement": eventManagement,
    "shoppingCart": shoppingCart,
    "defaultPlan": defaultPlan,
    "featured": featured,
    "flag": flag,
    "typeofIntegration": typeofIntegration,
    "currencies": List<dynamic>.from(currencies!.map((x) => x.toJson())),
    "planType": planType,
    "maxSubUsers": maxSubUsers,
    "maxShops": maxShops,
    "maxPOSPerShop": maxPosPerShop,
    "maxListedProducts": maxListedProducts,
    "maxPublishedEvents": maxPublishedEvents,
    "transactionLimits": List<dynamic>.from(transactionLimits!.map((x) => x)),
  };
}

class Currency {
  Currency({
    this.id,
    this.name,
    this.symbol,
    this.code,
  });

  int? id;
  String? name;
  String? symbol;
  String? code;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "code": code,
  };
}

class PaymentMethodsSet {
  PaymentMethodsSet({
    this.id,
    this.name,
    this.status,
    this.paymentCategory,
    this.checked,
  });

  int? id;
  String? name;
  bool? status;
  PaymentCategory? paymentCategory;
  bool? checked;

  factory PaymentMethodsSet.fromJson(Map<String, dynamic> json) => PaymentMethodsSet(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    paymentCategory: PaymentCategory.fromJson(json["paymentCategory"]),
    checked: json["checked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "paymentCategory": paymentCategory?.toJson(),
    "checked": checked,
  };
}

class PaymentCategory {
  PaymentCategory({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory PaymentCategory.fromJson(Map<String, dynamic> json) => PaymentCategory(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
