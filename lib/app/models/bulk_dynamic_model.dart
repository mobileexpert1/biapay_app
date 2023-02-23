import '../widgets/export_file.dart';

class BulkDynamicModel {
  TextEditingController? emailController,
      amountController,
      msgController,
      customerNameController = TextEditingController();
  String? selectedCurrnecy = "XAF";

  BulkDynamicModel(
      {this.emailController,
      this.amountController,
      this.msgController,
      this.selectedCurrnecy,
      this.customerNameController});
}
