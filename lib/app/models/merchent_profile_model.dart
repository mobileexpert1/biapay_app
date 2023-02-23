class MerchentProfile {
  String? status;
  String? message;
  MerchantProfileData? merchantProfile;

  MerchentProfile({this.status, this.message, this.merchantProfile});

  MerchentProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    merchantProfile = json['merchantProfile'] != null
        ? new MerchantProfileData.fromJson(json['merchantProfile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.merchantProfile != null) {
      data['merchantProfile'] = this.merchantProfile!.toJson();
    }
    return data;
  }
}

class MerchantProfileData {
  int? profileId;
  bool? twoFA;
  String? profileImagePath;
  String? profileImageContentType;
  Merchant? merchant;

  int? merchantId;

  MerchantProfileData(
      {this.profileId,
        this.twoFA,
        this.profileImagePath,
        this.profileImageContentType,
        this.merchant,

        this.merchantId});

  MerchantProfileData.fromJson(Map<String, dynamic> json) {
    profileId = json['profile_id'];
    twoFA = json['twoFA'];
    profileImagePath = json['profileImagePath'];
    profileImageContentType = json['profileImageContentType'];
    merchant = json['merchant'] != null
        ? new Merchant.fromJson(json['merchant'])
        : null;





    merchantId = json['merchantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_id'] = this.profileId;
    data['twoFA'] = this.twoFA;
    data['profileImagePath'] = this.profileImagePath;
    data['profileImageContentType'] = this.profileImageContentType;
    if (this.merchant != null) {
      data['merchant'] = this.merchant!.toJson();
    }

    data['merchantId'] = this.merchantId;
    return data;
  }
}

class Merchant {
  int? id;
  String? merchantName;
  String? merchantSiteId;
  bool? status;
  String? merchantStatus;
  String? walletAddress;
  int? phoneNo;
  String? email;
  bool? phoneVerified;
  String? phoneVerificationOTP;
  RootUser? rootUser;

  Merchant(
      {this.id,
        this.merchantName,
        this.merchantSiteId,
        this.status,
        this.merchantStatus,
        this.walletAddress,
        this.phoneNo,
        this.email,
        this.phoneVerified,
        this.phoneVerificationOTP,
        this.rootUser});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantName = json['merchantName'];
    merchantSiteId = json['merchantSiteId'];
    status = json['status'];
    merchantStatus = json['merchantStatus'];
    walletAddress = json['walletAddress'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    phoneVerified = json['phoneVerified'];
    phoneVerificationOTP = json['phoneVerificationOTP'];
    rootUser = json['rootUser'] != null
        ? new RootUser.fromJson(json['rootUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['merchantName'] = this.merchantName;
    data['merchantSiteId'] = this.merchantSiteId;
    data['status'] = this.status;
    data['merchantStatus'] = this.merchantStatus;
    data['walletAddress'] = this.walletAddress;
    data['phoneNo'] = this.phoneNo;
    data['email'] = this.email;
    data['phoneVerified'] = this.phoneVerified;
    data['phoneVerificationOTP'] = this.phoneVerificationOTP;
    if (this.rootUser != null) {
      data['rootUser'] = this.rootUser!.toJson();
    }
    return data;
  }
}

class RootUser {
  int? userId;
  String? email;
  String? name;
  String? username;
  int? failedLoginCount;
  String? userType;
  String? userStatus;
  bool? isEmailVerified;
  bool? isTwoFAEnabled;
  List<Null>? merchantShops;
  List<Null>? merchantPOSs;

  RootUser(
      {this.userId,
        this.email,
        this.name,
        this.username,
        this.failedLoginCount,
        this.userType,
        this.userStatus,
        this.isEmailVerified,
        this.isTwoFAEnabled,
        this.merchantShops,
        this.merchantPOSs});

  RootUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    name = json['name'];
    username = json['username'];
    failedLoginCount = json['failedLoginCount'];
    userType = json['userType'];
    userStatus = json['userStatus'];
    isEmailVerified = json['isEmailVerified'];
    isTwoFAEnabled = json['isTwoFAEnabled'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['username'] = this.username;
    data['failedLoginCount'] = this.failedLoginCount;
    data['userType'] = this.userType;
    data['userStatus'] = this.userStatus;
    data['isEmailVerified'] = this.isEmailVerified;
    data['isTwoFAEnabled'] = this.isTwoFAEnabled;

    return data;
  }
}


