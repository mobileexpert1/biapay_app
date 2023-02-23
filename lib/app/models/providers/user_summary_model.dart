class UserDashBoardSummaryModel {
  String? status;
  String? message;
  UserSummaryDataModel? userSummaryDTO;

  UserDashBoardSummaryModel({this.status, this.message, this.userSummaryDTO});

  UserDashBoardSummaryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userSummaryDTO = json['userSummaryDTO'] != null
        ?  UserSummaryDataModel.fromJson(json['userSummaryDTO'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userSummaryDTO != null) {
      data['merchantSummaryDTO'] = this.userSummaryDTO!.toJson();
    }
    return data;
  }
}

class UserSummaryDataModel {
  int? totalTickets;
  int? totalTransactions;
  int? totalTransactionAmount;

  UserSummaryDataModel({
    this.totalTickets,
    this.totalTransactions,
    this.totalTransactionAmount,
  });

  UserSummaryDataModel.fromJson(Map<String, dynamic> json) {
    totalTickets = json['totalTickets'];
    totalTransactions = json['totalTransactions'];
    totalTransactionAmount = json['totalTransactionAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalTickets'] = this.totalTickets;
    data['totalTransactions'] = this.totalTransactions;
    data['totalTransactionAmount'] = this.totalTransactionAmount;
    return data;
  }
}
