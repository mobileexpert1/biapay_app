class BulkMerchentModel {
  int? id;
  String? uuid;
  int? merchantId;
  String? merchantName;
  MerchantBulkPosModel? merchantPOS;
  String? email;
  var amount;
  String? currency;
  String? message;
  String? status;
  String? createdDate;

  BulkMerchentModel(
      {this.id,
        this.uuid,
        this.merchantId,
        this.merchantName,
        this.merchantPOS,
        this.email,
        this.amount,
        this.currency,
        this.message,
        this.status,
        this.createdDate});

  BulkMerchentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    merchantId = json['merchantId'];
    merchantName = json['merchantName'];
    merchantPOS = json['merchantPOS'] != null
        ? new MerchantBulkPosModel.fromJson(json['merchantPOS'])
        : null;
    email = json['email'];
    amount = json['amount'];
    currency = json['currency'];
    message = json['message'];
    status = json['status'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['merchantId'] = this.merchantId;
    data['merchantName'] = this.merchantName;
    if (this.merchantPOS != null) {
      data['merchantPOS'] = this.merchantPOS!.toJson();
    }
    data['email'] = this.email;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['message'] = this.message;
    data['status'] = this.status;
    data['createdDate'] = this.createdDate;
    return data;
  }
}

class MerchantBulkPosModel {
  int? id;
  int? shopId;
  String? callbackUrl;
  String? name;
  bool? status;
  bool? isDefault;
  String? uuid;

  MerchantBulkPosModel(
      {this.id,
        this.shopId,
        this.callbackUrl,
        this.name,
        this.status,
        this.isDefault,
        this.uuid});

  MerchantBulkPosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shopId'];
    callbackUrl = json['callbackUrl'];
    name = json['name'];
    status = json['status'];
    isDefault = json['isDefault'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shopId'] = this.shopId;
    data['callbackUrl'] = this.callbackUrl;
    data['name'] = this.name;
    data['status'] = this.status;
    data['isDefault'] = this.isDefault;
    data['uuid'] = this.uuid;
    return data;
  }
}
