class DashBoardSummaryModel {
  String? status;
  String? message;
  MerchantSummaryDataModel? merchantSummaryDTO;

  DashBoardSummaryModel({this.status, this.message, this.merchantSummaryDTO});

  DashBoardSummaryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    merchantSummaryDTO = json['merchantSummaryDTO'] != null
        ? new MerchantSummaryDataModel.fromJson(json['merchantSummaryDTO'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.merchantSummaryDTO != null) {
      data['merchantSummaryDTO'] = this.merchantSummaryDTO!.toJson();
    }
    return data;
  }
}

class MerchantSummaryDataModel {
  int? totalUsers;
  int? totalClients;
  int? totalTickets;
  int? totalPlans;
  int? totalPointOfSales;
  int? totalShops;

  MerchantSummaryDataModel(
      {this.totalUsers,
        this.totalClients,
        this.totalTickets,
        this.totalPlans,
        this.totalPointOfSales,
        this.totalShops});

  MerchantSummaryDataModel.fromJson(Map<String, dynamic> json) {
    totalUsers = json['totalUsers'];
    totalClients = json['totalClients'];
    totalTickets = json['totalTickets'];
    totalPlans = json['totalPlans'];
    totalPointOfSales = json['totalPointOfSales'];
    totalShops = json['totalShops'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalUsers'] = this.totalUsers;
    data['totalClients'] = this.totalClients;
    data['totalTickets'] = this.totalTickets;
    data['totalPlans'] = this.totalPlans;
    data['totalPointOfSales'] = this.totalPointOfSales;
    data['totalShops'] = this.totalShops;
    return data;
  }
}