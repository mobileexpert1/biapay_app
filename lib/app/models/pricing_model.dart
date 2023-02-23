// To parse this JSON data, do
//
//     final pricingModel = pricingModelFromJson(jsonString);

import 'dart:convert';

PricingModel pricingModelFromJson(String str) => PricingModel.fromJson(json.decode(str));

String pricingModelToJson(PricingModel data) => json.encode(data.toJson());

class PricingModel {
  PricingModel({
    this.status,
    this.message,
    this.merchantSubscriptionList,
  });

  String? status;
  String? message;
  List<MerchantSubscriptionList>? merchantSubscriptionList;

  factory PricingModel.fromJson(Map<String, dynamic> json) => PricingModel(
    status: json["status"],
    message: json["message"],
    merchantSubscriptionList: List<MerchantSubscriptionList>.from(json["merchantSubscriptionList"].map((x) => MerchantSubscriptionList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "merchantSubscriptionList": List<dynamic>.from(merchantSubscriptionList!.map((x) => x.toJson())),
  };
}

class MerchantSubscriptionList {
  MerchantSubscriptionList({
    this.id,
    this.merchantId,
    this.subscriptionPlan,
    this.subscriptionStatus,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
    this.merchantPos,
  });

  int? id;
  int? merchantId;
  SubscriptionPlan? subscriptionPlan;
  String? subscriptionStatus;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  MerchantPos? merchantPos;

  factory MerchantSubscriptionList.fromJson(Map<String, dynamic> json) => MerchantSubscriptionList(
    id: json["id"],
    merchantId: json["merchantId"],
    subscriptionPlan: SubscriptionPlan.fromJson(json["subscriptionPlan"]),
    subscriptionStatus: json["subscriptionStatus"],
    subscriptionStartDate: json["subscriptionStartDate"],
    subscriptionEndDate: json["subscriptionEndDate"],
    merchantPos: MerchantPos.fromJson(json["merchantPOS"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "merchantId": merchantId,
    "subscriptionPlan": subscriptionPlan!.toJson(),
    "subscriptionStatus": subscriptionStatus,
    "subscriptionStartDate": subscriptionStartDate,
    "subscriptionEndDate": subscriptionEndDate,
    "merchantPOS": merchantPos!.toJson(),
  };
}

class MerchantPos {
  MerchantPos({
    this.id,
    this.callbackUrl,
    this.name,
    this.status,
    this.isDefault,
    this.uuid,
  });

  int? id;
  String? callbackUrl;
  String? name;
  bool? status;
  bool? isDefault;
  String? uuid;

  factory MerchantPos.fromJson(Map<String, dynamic> json) => MerchantPos(
    id: json["id"],
    callbackUrl: json["callbackUrl"],
    name: json["name"],
    status: json["status"],
    isDefault: json["isDefault"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "callbackUrl": callbackUrl,
    "name": name,
    "status": status,
    "isDefault": isDefault,
    "uuid": uuid,
  };
}

class SubscriptionPlan {
  SubscriptionPlan({
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
  List<TransactionLimit>? transactionLimits;

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) => SubscriptionPlan(
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
    transactionLimits: List<TransactionLimit>.from(json["transactionLimits"].map((x) => TransactionLimit.fromJson(x))),
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
    "transactionLimits": List<dynamic>.from(transactionLimits!.map((x) => x.toJson())),
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
    this.isChecked,
    this.paymentCategory,
  });

  int? id;
  String? name;
  bool? status;
  bool? isChecked;
  PaymentCategory? paymentCategory;

  factory PaymentMethodsSet.fromJson(Map<String, dynamic> json) => PaymentMethodsSet(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    isChecked: json["isChecked"],
    paymentCategory: PaymentCategory.fromJson(json["paymentCategory"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "isChecked": isChecked,
    "paymentCategory": paymentCategory!.toJson(),
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

class TransactionLimit {
  TransactionLimit({
    this.id,
    this.sendingDaily,
    this.sendingWeekly,
    this.sendingMonthly,
    this.receivingDaily,
    this.receivingWeekly,
    this.receivingMonthly,
    this.currencyId,
    this.subscriptionPlanId,
  });

  int? id;
  double? sendingDaily;
  double? sendingWeekly;
  double? sendingMonthly;
  double? receivingDaily;
  double? receivingWeekly;
  double? receivingMonthly;
  int? currencyId;
  int? subscriptionPlanId;

  factory TransactionLimit.fromJson(Map<String, dynamic> json) => TransactionLimit(
    id: json["id"],
    sendingDaily: json["sendingDaily"],
    sendingWeekly: json["sendingWeekly"],
    sendingMonthly: json["sendingMonthly"],
    receivingDaily: json["receivingDaily"],
    receivingWeekly: json["receivingWeekly"],
    receivingMonthly: json["receivingMonthly"],
    currencyId: json["currencyId"],
    subscriptionPlanId: json["subscriptionPlanId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sendingDaily": sendingDaily,
    "sendingWeekly": sendingWeekly,
    "sendingMonthly": sendingMonthly,
    "receivingDaily": receivingDaily,
    "receivingWeekly": receivingWeekly,
    "receivingMonthly": receivingMonthly,
    "currencyId": currencyId,
    "subscriptionPlanId": subscriptionPlanId,
  };
}
