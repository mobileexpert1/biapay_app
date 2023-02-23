class MerchentSubscriptionModel {
  String? status;
  String? message;
  List<MerchantSubscriptionDataModel>? merchantSubscriptionList;

  MerchentSubscriptionModel({this.status, this.message, this.merchantSubscriptionList});

  MerchentSubscriptionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['merchantSubscriptionList'] != null) {
      merchantSubscriptionList = <MerchantSubscriptionDataModel>[];
      json['merchantSubscriptionList'].forEach((v) {
        merchantSubscriptionList!.add(new MerchantSubscriptionDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.merchantSubscriptionList != null) {
      data['merchantSubscriptionList'] =
          this.merchantSubscriptionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MerchantSubscriptionDataModel {
  var id;
  var merchantId;
  SubscriptionPlan? subscriptionPlan;
  String? subscriptionStatus;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  MerchantPOS? merchantPOS;
  SubscriptionPayment? subscriptionPayment;
  String? updatedDate;

  MerchantSubscriptionDataModel(
      {this.id,
        this.merchantId,
        this.subscriptionPlan,
        this.subscriptionStatus,
        this.subscriptionStartDate,
        this.subscriptionEndDate,
        this.merchantPOS,
        this.subscriptionPayment,
        this.updatedDate});

  MerchantSubscriptionDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantId = json['merchantId'];
    subscriptionPlan = json['subscriptionPlan'] != null
        ? new SubscriptionPlan.fromJson(json['subscriptionPlan'])
        : null;
    subscriptionStatus = json['subscriptionStatus'];
    subscriptionStartDate = json['subscriptionStartDate'];
    subscriptionEndDate = json['subscriptionEndDate'];
    merchantPOS = json['merchantPOS'] != null
        ? new MerchantPOS.fromJson(json['merchantPOS'])
        : null;
    subscriptionPayment = json['subscriptionPayment'] != null
        ? new SubscriptionPayment.fromJson(json['subscriptionPayment'])
        : null;
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['merchantId'] = this.merchantId;
    if (this.subscriptionPlan != null) {
      data['subscriptionPlan'] = this.subscriptionPlan!.toJson();
    }
    data['subscriptionStatus'] = this.subscriptionStatus;
    data['subscriptionStartDate'] = this.subscriptionStartDate;
    data['subscriptionEndDate'] = this.subscriptionEndDate;
    if (this.merchantPOS != null) {
      data['merchantPOS'] = this.merchantPOS!.toJson();
    }
    if (this.subscriptionPayment != null) {
      data['subscriptionPayment'] = this.subscriptionPayment!.toJson();
    }
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}

class SubscriptionPlan {
  var id;
  String? subscriptionName;
  var subscriptionAmount;
  var subscriptionDays;
  bool? subscriptionStatus;
  String? typeofChannels;
  var numberofTransaction;
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
  List<Currencies>? currencies;
  String? planType;
  var maxSubUsers;
  var maxShops;
  var maxPOSPerShop;
  var maxListedProducts;
  var maxPublishedEvents;
  List<TransactionLimits>? transactionLimits;

  SubscriptionPlan(
      {this.id,
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
        this.maxPOSPerShop,
        this.maxListedProducts,
        this.maxPublishedEvents,
        this.transactionLimits});

  SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subscriptionName = json['subscriptionName'];
    subscriptionAmount = json['subscriptionAmount'];
    subscriptionDays = json['subscriptionDays'];
    subscriptionStatus = json['subscriptionStatus'];
    typeofChannels = json['typeofChannels'];
    numberofTransaction = json['numberofTransaction'];
    settlementPeriod = json['settlementPeriod'];
    invoicePeriod = json['invoicePeriod'];
    if (json['paymentMethodsSet'] != null) {
      paymentMethodsSet = <PaymentMethodsSet>[];
      json['paymentMethodsSet'].forEach((v) {
        paymentMethodsSet!.add(new PaymentMethodsSet.fromJson(v));
      });
    }
    typeofPayment = json['typeofPayment'];
    shoppingcardAllowance = json['shoppingcardAllowance'];
    ancillariesAllowance = json['ancillariesAllowance'];
    paymaillinkRequest = json['paymaillinkRequest'];
    downgradeAllowable = json['downgradeAllowable'];
    invoicePayment = json['invoicePayment'];
    eventManagement = json['eventManagement'];
    shoppingCart = json['shoppingCart'];
    defaultPlan = json['defaultPlan'];
    featured = json['featured'];
    flag = json['flag'];
    typeofIntegration = json['typeofIntegration'];
    if (json['currencies'] != null) {
      currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(new Currencies.fromJson(v));
      });
    }
    planType = json['planType'];
    maxSubUsers = json['maxSubUsers'];
    maxShops = json['maxShops'];
    maxPOSPerShop = json['maxPOSPerShop'];
    maxListedProducts = json['maxListedProducts'];
    maxPublishedEvents = json['maxPublishedEvents'];
    if (json['transactionLimits'] != null) {
      transactionLimits = <TransactionLimits>[];
      json['transactionLimits'].forEach((v) {
        transactionLimits!.add(new TransactionLimits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subscriptionName'] = this.subscriptionName;
    data['subscriptionAmount'] = this.subscriptionAmount;
    data['subscriptionDays'] = this.subscriptionDays;
    data['subscriptionStatus'] = this.subscriptionStatus;
    data['typeofChannels'] = this.typeofChannels;
    data['numberofTransaction'] = this.numberofTransaction;
    data['settlementPeriod'] = this.settlementPeriod;
    data['invoicePeriod'] = this.invoicePeriod;
    if (this.paymentMethodsSet != null) {
      data['paymentMethodsSet'] =
          this.paymentMethodsSet!.map((v) => v.toJson()).toList();
    }
    data['typeofPayment'] = this.typeofPayment;
    data['shoppingcardAllowance'] = this.shoppingcardAllowance;
    data['ancillariesAllowance'] = this.ancillariesAllowance;
    data['paymaillinkRequest'] = this.paymaillinkRequest;
    data['downgradeAllowable'] = this.downgradeAllowable;
    data['invoicePayment'] = this.invoicePayment;
    data['eventManagement'] = this.eventManagement;
    data['shoppingCart'] = this.shoppingCart;
    data['defaultPlan'] = this.defaultPlan;
    data['featured'] = this.featured;
    data['flag'] = this.flag;
    data['typeofIntegration'] = this.typeofIntegration;
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.map((v) => v.toJson()).toList();
    }
    data['planType'] = this.planType;
    data['maxSubUsers'] = this.maxSubUsers;
    data['maxShops'] = this.maxShops;
    data['maxPOSPerShop'] = this.maxPOSPerShop;
    data['maxListedProducts'] = this.maxListedProducts;
    data['maxPublishedEvents'] = this.maxPublishedEvents;
    if (this.transactionLimits != null) {
      data['transactionLimits'] =
          this.transactionLimits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentMethodsSet {
  var id;
  String? name;
  bool? status;
  bool? isChecked;
  PaymentCategory? paymentCategory;

  PaymentMethodsSet(
      {this.id, this.name, this.status, this.isChecked, this.paymentCategory});

  PaymentMethodsSet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    isChecked = json['isChecked'];
    paymentCategory = json['paymentCategory'] != null
        ? new PaymentCategory.fromJson(json['paymentCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['isChecked'] = this.isChecked;
    if (this.paymentCategory != null) {
      data['paymentCategory'] = this.paymentCategory!.toJson();
    }
    return data;
  }
}

class PaymentCategory {
  var id;
  String? name;

  PaymentCategory({this.id, this.name});

  PaymentCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Currencies {
  var id;
  String? name;
  String? symbol;
  String? code;

  Currencies({this.id, this.name, this.symbol, this.code});

  Currencies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['code'] = this.code;
    return data;
  }
}

class TransactionLimits {
  var id;
  var sendingDaily;
  var sendingWeekly;
  var sendingMonthly;
  var receivingDaily;
  var receivingWeekly;
  var receivingMonthly;
  var currencyId;
  var subscriptionPlanId;

  TransactionLimits(
      {this.id,
        this.sendingDaily,
        this.sendingWeekly,
        this.sendingMonthly,
        this.receivingDaily,
        this.receivingWeekly,
        this.receivingMonthly,
        this.currencyId,
        this.subscriptionPlanId});

  TransactionLimits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sendingDaily = json['sendingDaily'];
    sendingWeekly = json['sendingWeekly'];
    sendingMonthly = json['sendingMonthly'];
    receivingDaily = json['receivingDaily'];
    receivingWeekly = json['receivingWeekly'];
    receivingMonthly = json['receivingMonthly'];
    currencyId = json['currencyId'];
    subscriptionPlanId = json['subscriptionPlanId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sendingDaily'] = this.sendingDaily;
    data['sendingWeekly'] = this.sendingWeekly;
    data['sendingMonthly'] = this.sendingMonthly;
    data['receivingDaily'] = this.receivingDaily;
    data['receivingWeekly'] = this.receivingWeekly;
    data['receivingMonthly'] = this.receivingMonthly;
    data['currencyId'] = this.currencyId;
    data['subscriptionPlanId'] = this.subscriptionPlanId;
    return data;
  }
}

class MerchantPOS {
  var id;
  String? callbackUrl;
  String? name;
  bool? status;
  bool? isDefault;
  String? uuid;

  MerchantPOS(
      {this.id,
        this.callbackUrl,
        this.name,
        this.status,
        this.isDefault,
        this.uuid});

  MerchantPOS.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    callbackUrl = json['callbackUrl'];
    name = json['name'];
    status = json['status'];
    isDefault = json['isDefault'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['callbackUrl'] = this.callbackUrl;
    data['name'] = this.name;
    data['status'] = this.status;
    data['isDefault'] = this.isDefault;
    data['uuid'] = this.uuid;
    return data;
  }
}

class SubscriptionPayment {
  var id;
  var subscriptionAmount;
  String? createdBy;
  String? createdDate;
  String? lastModifiedBy;
  String? lastModifiedDate;

  SubscriptionPayment(
      {this.id,
        this.subscriptionAmount,
        this.createdBy,
        this.createdDate,
        this.lastModifiedBy,
        this.lastModifiedDate});

  SubscriptionPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subscriptionAmount = json['subscriptionAmount'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedDate = json['lastModifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subscriptionAmount'] = this.subscriptionAmount;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['lastModifiedDate'] = this.lastModifiedDate;
    return data;
  }
}
