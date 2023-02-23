class GeneratePayLinkModel {
  List<GeneratePayLinkDataModel>? content;
  Pageable? pageable;
  bool? last;
  var totalElements;
  int? totalPages;
  var number;
  Sort? sort;
  var size;
  var numberOfElements;
  bool? first;
  bool? empty;

  GeneratePayLinkModel(
      {this.content,
        this.pageable,
        this.last,
        this.totalElements,
        this.totalPages,
        this.number,
        this.sort,
        this.size,
        this.numberOfElements,
        this.first,
        this.empty});

  GeneratePayLinkModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <GeneratePayLinkDataModel>[];
      json['content'].forEach((v) {
        content!.add(new GeneratePayLinkDataModel.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    last = json['last'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    number = json['number'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    size = json['size'];
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['last'] = this.last;
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    data['number'] = this.number;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['size'] = this.size;
    data['numberOfElements'] = this.numberOfElements;
    data['first'] = this.first;
    data['empty'] = this.empty;
    return data;
  }
}

class GeneratePayLinkDataModel {
  var id;
  String? uuid;
  var merchantId;
  String? merchantName;
  MerchantPOS? merchantPOS;
  String? mobileNumber;
  String? customerName;
  String? email;
  var amount;
  String? currency;
  String? message;
  String? status;
  String? createdDate;
  String? code;

  GeneratePayLinkDataModel(
      {this.id,
        this.uuid,
        this.merchantId,
        this.merchantName,
        this.merchantPOS,
        this.mobileNumber,
        this.customerName,
        this.email,
        this.code,
        this.amount,
        this.currency,
        this.message,
        this.status,
        this.createdDate});

  GeneratePayLinkDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    code = json['code'];
    merchantId = json['merchantId'];
    merchantName = json['merchantName'];
    merchantPOS = json['merchantPOS'] != null
        ? new MerchantPOS.fromJson(json['merchantPOS'])
        : null;
    mobileNumber = json['mobileNumber'];
    customerName = json['customerName'];
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
    data['code'] = this.code;
    data['uuid'] = this.uuid;
    data['merchantId'] = this.merchantId;
    data['merchantName'] = this.merchantName;
    if (this.merchantPOS != null) {
      data['merchantPOS'] = this.merchantPOS!.toJson();
    }
    data['mobileNumber'] = this.mobileNumber;
    data['customerName'] = this.customerName;
    data['email'] = this.email;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['message'] = this.message;
    data['status'] = this.status;
    data['createdDate'] = this.createdDate;
    return data;
  }
}

class MerchantPOS {
  var id;
  var shopId;
  String? callbackUrl;
  String? name;
  bool? status;
  bool? isDefault;
  String? uuid;

  MerchantPOS(
      {this.id,
        this.shopId,
        this.callbackUrl,
        this.name,
        this.status,
        this.isDefault,
        this.uuid});

  MerchantPOS.fromJson(Map<String, dynamic> json) {
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

class Pageable {
  Sort? sort;
  var offset;
  var pageNumber;
  var pageSize;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.sort,
        this.offset,
        this.pageNumber,
        this.pageSize,
        this.paged,
        this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['offset'] = this.offset;
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['paged'] = this.paged;
    data['unpaged'] = this.unpaged;
    return data;
  }
}

class Sort {
  bool? sorted;
  bool? unsorted;
  bool? empty;

  Sort({this.sorted, this.unsorted, this.empty});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    unsorted = json['unsorted'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sorted'] = this.sorted;
    data['unsorted'] = this.unsorted;
    data['empty'] = this.empty;
    return data;
  }
}
