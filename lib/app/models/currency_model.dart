class CurrencyModel {
  int? id;
  String? name;
  String? code;
  String? symbol;
  var rate;
  bool? isActive;
  bool? isDefault;

  CurrencyModel(
      {this.id,
        this.name,
        this.code,
        this.symbol,
        this.rate,
        this.isActive,
        this.isDefault});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    symbol = json['symbol'];
    rate = json['rate'];
    isActive = json['isActive'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['symbol'] = this.symbol;
    data['rate'] = this.rate;
    data['isActive'] = this.isActive;
    data['isDefault'] = this.isDefault;
    return data;
  }
}


