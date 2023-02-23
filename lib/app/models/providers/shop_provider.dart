import 'package:biapay_app/app/models/providers/base_provider.dart';

class ShopProvider extends BaseProvider {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> addShop(String name) async {}

  @override
  Future<void> downloadExcel() async {
    // if (shopList.shops.isNotEmpty) {
    //   try {
    //     final List<Map<String, String>> tableData = shopList.shops
    //         .map((e) => {'id': e.shopId.toString(), 'name': e.name})
    //         .toList();

    //     final excel = createExcel(tableData: tableData);

    //     final PermissionStatus status = await Permission.storage.status;

    //     if (!status.isGranted) {
    //       await Permission.storage.request();
    //     }

    //     const String filePath = "/storage/emulated/0/Download/shop.xlsx";

    //     final List<int> onValue = excel.encode()!;
    //     final File excelFile = File(path.join(filePath))
    //       ..createSync(recursive: true)
    //       ..writeAsBytesSync(onValue);

    //     of.OpenFile.open(excelFile.path);

    //     return right(unit);
    //   } catch (e) {
    //     return left(ValueFailure(e.toString()));
    //   }
    // } else {
    //   return left(const ValueFailure('List is empty'));
    // }
  }

  @override
  Future<void> downloadPdf() async {
    // if (shopList.shops.isNotEmpty) {
    //   try {
    //     final List<Map<String, String>> tableData = shopList.shops
    //         .map((e) => {'id': e.shopId.toString(), 'name': e.name})
    //         .toList();

    //     final Document pdf = await createPdfTable(tableData: tableData);

    //     const String filePath = "/storage/emulated/0/Download/shop.pdf";

    //     final File excelFile = File(path.join(filePath))
    //       ..createSync(recursive: true)
    //       ..writeAsBytesSync(await pdf.save());

    //     of.OpenFile.open(excelFile.path);
    //     return right(unit);
    //   } catch (e) {
    //     return left(ValueFailure(e.toString()));
    //   }
    // } else {
    //   return left(const ValueFailure('List is empty'));
    // }
  }
}
