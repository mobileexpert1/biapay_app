class ChartData {
  Map<String, dynamic> transactionsByCategory = {};
  Map<String, dynamic> transactionsByMethod = {};
  Map<String, dynamic> transactionsByShop = {};
  Map<String, dynamic> transactionsBySubscription = {};
  double totalTransactions = 0;
  double totalTransactionAmount = 0;

  ChartData.fromJson(Map<String, dynamic> json) {
    transactionsByCategory = json['transactionsByCategory'] ?? {};
    transactionsByMethod = json['transactionsByMethod'] ?? {};
    transactionsByShop = json['transactionsByShop'] ?? {};
    transactionsBySubscription = json['transactionsBySubscription'] ?? {};
    totalTransactions = json['totalTransactions'] * 1.0;
    totalTransactionAmount = json['totalTransactionAmount'] * 1.0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['transactionsByCategory'] = transactionsByCategory;
    data['transactionsByMethod'] = transactionsByMethod;
    data['transactionsByShop'] = transactionsByShop;
    data['transactionsBySubscription'] = transactionsBySubscription;
    data['totalTransactions'] = totalTransactions;
    data['totalTransactionAmount'] = totalTransactionAmount;
    return data;
  }
}
