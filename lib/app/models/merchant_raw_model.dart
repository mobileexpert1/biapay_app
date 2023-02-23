class MerchantRawModel {
  int? id;
  String? uuid;
  String? createdDate;
  String? status;
  int? merchantId;
  MerchantRawPosModel? merchantPOS;
  String? mobileNumber;
  String? customerName;
  String? email;
  var amount;
  String? currency;
  String? message;

  MerchantRawModel(
      {this.merchantId,
        this.id,
        this.uuid,
        this.merchantPOS,
        this.createdDate,
        this.mobileNumber,
        this.customerName,
        this.email,
        this.amount,
        this.currency,
        this.status,
        this.message});

  MerchantRawModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    uuid = json['uuid'];
    createdDate = json['createdDate'];
    merchantId = json['merchantId'];
    merchantPOS = json['merchantPOS'] != null
        ? new MerchantRawPosModel.fromJson(json['merchantPOS'])
        : null;
    mobileNumber = json['mobileNumber'];
    customerName = json['customerName'];
    email = json['email'];
    amount = json['amount'];
    currency = json['currency'];
    message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['uuid'] = this.uuid;
    data['merchantId'] = this.merchantId;
    if (this.merchantPOS != null) {
      data['merchantPOS'] = this.merchantPOS!.toJson();
    }
    data['mobileNumber'] = this.mobileNumber;
    data['customerName'] = this.customerName;
    data['email'] = this.email;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['message'] = this.message;
    data['createdDate'] = this.createdDate;

    return data;
  }
}

class MerchantRawPosModel {
  int? id;

  MerchantRawPosModel({this.id});

  MerchantRawPosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}