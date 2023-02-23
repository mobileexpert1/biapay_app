class AmountShopCollectionModel {
  String? dashBoardName;
  String? dashBoardItemValueType;
  int? numberOfItems;
  List<DashBoardItems>? dashBoardItems;

  AmountShopCollectionModel(
      {this.dashBoardName,
        this.dashBoardItemValueType,
        this.numberOfItems,
        this.dashBoardItems});

  AmountShopCollectionModel.fromJson(Map<String, dynamic> json) {
    dashBoardName = json['dashBoardName'];
    dashBoardItemValueType = json['dashBoardItemValueType'];
    numberOfItems = json['numberOfItems'];
    if (json['dashBoardItems'] != null) {
      dashBoardItems = <DashBoardItems>[];
      json['dashBoardItems'].forEach((v) {
        dashBoardItems!.add(new DashBoardItems.fromJson(v));
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

class DashBoardItems {
  String? currency;
  double? total;
  int? counter;

  DashBoardItems({this.currency, this.total, this.counter});

  DashBoardItems.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    total = json['total'];
    counter = json['counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['total'] = this.total;
    data['counter'] = this.counter;
    return data;
  }
}