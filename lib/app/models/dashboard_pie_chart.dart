class DashBoardPieModel {
  String? dashBoardName;
  String? dashBoardItemValueType;
  int? numberOfItems;
  List<DashBoardPieDataModel>? dashBoardItems;

  DashBoardPieModel(
      {this.dashBoardName,
        this.dashBoardItemValueType,
        this.numberOfItems,
        this.dashBoardItems});

  DashBoardPieModel.fromJson(Map<String, dynamic> json) {
    dashBoardName = json['dashBoardName'];
    dashBoardItemValueType = json['dashBoardItemValueType'];
    numberOfItems = json['numberOfItems'];
    if (json['dashBoardItems'] != null) {
      dashBoardItems = <DashBoardPieDataModel>[];
      json['dashBoardItems'].forEach((v) {
        dashBoardItems!.add(new DashBoardPieDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dashBoardName'] = this.dashBoardName;
    data['dashBoardItemValueType'] = this.dashBoardItemValueType;
    data['numberOfItems'] = this.numberOfItems;
    if (this.dashBoardItems != null) {
      data['dashBoardItems'] =
          this.dashBoardItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DashBoardPieDataModel {
  String? currency;
  int? total;
  int? counter;
  List<DashBoardItemValues>? dashBoardItemValues;

  DashBoardPieDataModel(
      {this.currency, this.total, this.counter, this.dashBoardItemValues});

  DashBoardPieDataModel.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    total = json['total'];
    counter = json['counter'];
    if (json['dashBoardItemValues'] != null) {
      dashBoardItemValues = <DashBoardItemValues>[];
      json['dashBoardItemValues'].forEach((v) {
        dashBoardItemValues!.add(new DashBoardItemValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['total'] = this.total;
    data['counter'] = this.counter;
    if (this.dashBoardItemValues != null) {
      data['dashBoardItemValues'] =
          this.dashBoardItemValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DashBoardItemValues {
  int? keyId;
  String? keyName;
  double? totalValue;
  int? itemCount;

  DashBoardItemValues(
      {this.keyId, this.keyName, this.totalValue, this.itemCount});

  DashBoardItemValues.fromJson(Map<String, dynamic> json) {
    keyId = json['keyId'];
    keyName = json['keyName'];
    totalValue = json['totalValue'];
    itemCount = json['itemCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyId'] = this.keyId;
    data['keyName'] = this.keyName;
    data['totalValue'] = this.totalValue;
    data['itemCount'] = this.itemCount;
    return data;
  }
}