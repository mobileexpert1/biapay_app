class MerchentShopModel {
  String? status;
  String? message;
  List<MerchentShopDataModel>? shops;

  MerchentShopModel({this.status, this.message, this.shops});

  MerchentShopModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['shops'] != null) {
      shops = <MerchentShopDataModel>[];
      json['shops'].forEach((v) {
        shops!.add(new MerchentShopDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.shops != null) {
      data['shops'] = this.shops!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MerchentShopDataModel {
  int? shopId;
  String? name;
  bool? status;
  List<MerchantPosModel>? merchantPOSList;

  MerchentShopDataModel({this.shopId, this.name, this.status, this.merchantPOSList});

  MerchentShopDataModel.fromJson(Map<String, dynamic> json) {
    shopId = json['shopId'];
    name = json['name'];
    status = json['status'];
    if (json['merchantPOSList'] != null) {
      merchantPOSList = <MerchantPosModel>[];
      json['merchantPOSList'].forEach((v) {
        merchantPOSList!.add(new MerchantPosModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopId'] = this.shopId;
    data['name'] = this.name;
    data['status'] = this.status;
    if (this.merchantPOSList != null) {
      data['merchantPOSList'] =
          this.merchantPOSList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MerchantPosModel {
  int? id;
  int? shopId;
  String? callbackUrl;
  String? name;
  bool? status;
  bool? isDefault;
  String? uuid;

  MerchantPosModel(
      {this.id,
        this.shopId,
        this.callbackUrl,
        this.name,
        this.status,
        this.isDefault,
        this.uuid});

  MerchantPosModel.fromJson(Map<String, dynamic> json) {
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



