import 'dart:math';

import 'package:biapay_app/app/models/POSModel.dart';
import 'package:biapay_app/app/models/customer_model.dart';
import 'package:biapay_app/app/models/product_model.dart';
import 'package:biapay_app/app/models/shop_model.dart';
import 'package:biapay_app/app/modules/events/views/new_event.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';
import '../../../../../models/currency_model.dart';

class CreateInvoiceController extends GetxController {
  // ------ CURRENCY
  RxList<CurrencyModel> currencyList = <CurrencyModel>[].obs;
  RxList currencyElementList = [].obs;
  int currencyId = 0;

  // ------ POS
  RxList<PosMerchant> posList = <PosMerchant>[].obs;
  RxList posElementList = [].obs;
  int posId = 0;

  // ------ SHOP
  RxList<Shop> shopList = <Shop>[].obs;
  RxList shopElementList = [].obs;
  int shopId = 0;

  // ------ CUSTOMER
  RxList<CustomerModel> customerList = <CustomerModel>[].obs;
  RxList customerElementList = [].obs;
  int customerId = 0;

  // ------ PRODUCT
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList productElementList = [].obs;
  int productId = 0;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      onLoad();
    });
    super.onInit();
  }

  onLoad() {
    getCurrencies();
    getShopsList();
    getCustomerList();
    getProductList();
  }

  final invoiceNumber = TextEditingController();
  final invoiceDate = TextEditingController();
  final orderNumber = TextEditingController();
  final dueDate = TextEditingController();
  final selectCustomer = TextEditingController();
  final selectCurrency = TextEditingController();
  final selectShop = TextEditingController();
  final selectPOS = TextEditingController();
  final deliveryAddress = TextEditingController();
  final selectProduct = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  final discountRateController = TextEditingController();
  final discountAmountController = TextEditingController();
  final shipping_feeController = TextEditingController();
  final taxController = TextEditingController();
  final sub_totalController = TextEditingController();

  String global_sub_total_amount = "0";
  String global_tax_amount = "0";
  String global_discount_amount = "0";
  String total_amount = "0";
  int localTotal = 0;

  //String merchantId = "";
  //String merchantPOSId = "";

  bool discountBool = false;

  List<int> descriptionArray = [1];
  int description = 1;

  List<Map<String, dynamic>> customFieldList = [];
  Map<String, dynamic> fields = {};
  double tempProductPrice = 0.0;

  setCustomFieldsListData() {
    Map<String, dynamic> localCustomFieldMap = {};
    localCustomFieldMap.clear();
    localCustomFieldMap["productId"] = 1;
    localCustomFieldMap["description"] = descriptionController.text;
    localCustomFieldMap["quantity"] = quantityController.text;
    localCustomFieldMap["price"] = priceController.text;
    localCustomFieldMap["discount"] = discountRateController.text;
    localCustomFieldMap["isDiscountPercentage"] = discountBool;
    localCustomFieldMap["discountAmount"] = discountAmountController.text;
    localCustomFieldMap["taxPercentage"] = taxController.text;
    localCustomFieldMap["shippingFee"] = shipping_feeController.text;
    localCustomFieldMap["subtotal"] = sub_totalController.text;
    customFieldList.add(localCustomFieldMap);
  }

  setFieldsMap() {
    setCustomFieldsListData();

    fields["invoiceNo"] = invoiceNumber.text;
    fields["orderNo"] = orderNumber.text;
    fields["invoiceDate"] = invoiceDate.text;
    fields["dueDate"] = dueDate.text;
    fields["subTotal"] = global_sub_total_amount;
    fields["taxTotal"] = global_tax_amount;
    fields["discountTotal"] = global_discount_amount;
    fields["total"] = total_amount;
    fields["currencyId"] = currencyId;
    fields["merchantId"] = 195; // merchantId from GetUserProfile
    fields["shopId"] = shopId;
    fields["customerId"] = customerId;
    fields["merchantPOSId"] = posId;
    fields["invoiceItemDTOList"] = customFieldList;
    update();
    print("-*-*-*-*-*-*- params : " + fields.toString());

    // createInvoiceApi();
  }

  createInvoiceApi() async {
    hidekeyboard();
    Get.showLoader();
    await userProvider.createInvoice(data: fields).then((value) {
      Get.closeLoader();
      if (value != null) {
        print("invoice created ------>> ");
        print(value.toString());
        Get.back(result: "returned");
      }
    }).onError((error, stackTrace) {
      print("invoice error ------>> ");
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }

  onRefreshInvoiceNumber() {
    DateTime now = DateTime.now();

    invoiceNumber.text = "${now.day.toString()}-"
        "${now.month.toString().padLeft(2, '0')}-"
        "${now.year.toString().padLeft(2, '0')}"
        "${generateRandomString(8)}";
     update();
  }

  onDiscountChange(String onChangeText) {
    updateBottomDetailView(discountAmount: onChangeText);
  }

  onTaxFieldChange(String onChangeText) {
    updateBottomDetailView(taxAmount: onChangeText);
  }

  onSubTotalFieldChange(String onChangeText) {
    updateBottomDetailView(subTotalAmount: onChangeText);
  }

  updateBottomDetailView({
    String? taxAmount,
    String? subTotalAmount,
    String? discountAmount,
    String? totalAmount,
  }) {
    if (taxAmount != null) {
      taxAmount == "" ? (global_tax_amount = "0") : (global_tax_amount = taxAmount);
    }
    if (subTotalAmount != null) {
      subTotalAmount == "" ? (global_sub_total_amount = "0") : (global_sub_total_amount = subTotalAmount);
    }
    if (discountAmount != null) {
      discountAmount == "" ? (global_discount_amount = "0") : (global_discount_amount = discountAmount);
    }
    totalAmount = ((double.parse(global_tax_amount ?? "0") + double.parse(global_sub_total_amount ?? "0")) - double.parse(global_discount_amount ?? "0")).toString();
    totalAmount == "" ? (total_amount = "0") : (total_amount = totalAmount);
    update();
  }
}

// ------------------------------------------------------------------------- CUSTOMER
extension getCustomer on CreateInvoiceController {
  getCustomerList() async {
    await userProvider.customerListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        customerList.addAll(value);
        customerList.refresh();
        customerList.forEach((element) {
          customerElementList.add(element.firstName);
        });
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  getCustomerId(String customer) {
    for (var i = 0; i < customerList.length; i++) {
      if ((customerList[i].firstName) == customer) {
        customerId = customerList[i].id!;
      }
    }
    print("customer ID -----------> " + customerId.toString());
    update();
  }
}

// ------------------------------------------------------------------------- CURRENCY
extension getCurrency on CreateInvoiceController {
  getCurrencies() async {
    Get.showLoader();
    await userProvider.currencyListApiCall().then((value) {
      if (value != null) {
        currencyList.addAll(value);
        currencyList.refresh();
        update();
        filterListWithStatus();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterListWithStatus() {
    if (currencyList.value.length != 0) {
      currencyList.value = currencyList.where((e) => e.isActive == true).toList();
      currencyList.refresh();
      currencyList.forEach((element) {
        currencyElementList.add(element.name);
      });
      currencyList.refresh();
      update();
    }
  }

  getCurrencyId(String currency) {
    for (var i = 0; i < currencyList.length; i++) {
      if (currencyList[i].name == currency) {
        currencyId = currencyList[i].id!;
      }
    }
    print("currency ID-----------> " + currencyId.toString());
    update();
  }
}

// ------------------------------------------------------------------------- SHOPS
extension getShops on CreateInvoiceController {
  getShopsList() async {
    await userProvider.shopListApiCall().then((value) {
      if (value != null) {
        ShopModel model = value;
        shopList.addAll(model.shops!.toList());
        shopList.refresh();
        update();
        filterShopListWithStatus();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterShopListWithStatus() {
    if (shopList.value.length != 0) {
      shopList.value = shopList.where((e) => e.status == true).toList();
      shopList.refresh();
      shopList.forEach((element) {
        shopElementList.add(element.name);
      });
      shopList.refresh();
      update();
    }
  }

  getShopId(String shop) {
    for (var i = 0; i < shopList.length; i++) {
      if (shopList[i].name == shop) {
        shopId = shopList[i].shopId!;
      }
    }
    print("shop ID -----------> " + shopId.toString());
    Get.showLoader();
    getPOSList("${shopId.toString()}/pos");
    update();
  }
}

// ------------------------------------------------------------------------- POS
extension getPOS on CreateInvoiceController {
  getPOSList(String shopId) async {
    print("-*-*-*-*-*-*-*-*-*-*-*-");
    print(posList.length);
    print(posElementList.length);
    posList.clear();
    posElementList.clear();
    print(posList.length);
    print(posElementList.length);
    print("-*-*-*-*-*-*-*-*-*-*-*-");
    print("extended pos url ----------------> " + shopId);
    await userProvider.POSListApiCall(shopId).then((value) {
      Get.closeLoader();
      if (value != null) {
        PosModel model = value;
        posList.addAll(model.posMerchants!.toList());
        posList.refresh();
        update();
        filterPOSListWithStatus();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterPOSListWithStatus() {
    if (posList.value.length != 0) {
      posList.value = posList.where((e) => e.status == true).toList();
      posList.refresh();
      posList.forEach((element) {
        posElementList.add(element.name);
      });
      posList.refresh();
      update();
    }
  }

  getPOSId(String pos) {
    for (var i = 0; i < posList.length; i++) {
      if (posList[i].name == pos) {
        posId = posList[i].id!;
      }
    }
    print("pod ID -----------> " + posId.toString());
    update();
  }
}

// ------------------------------------------------------------------------- PRODUCT
extension getProduct on CreateInvoiceController {
  getProductList() async {
    await userProvider.productListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        productList.addAll(value);
        productList.forEach((element) {
          productElementList.add(element.name);
        });
        productList.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  getProductId(String product) {
    for (var i = 0; i < productList.length; i++) {
      if (productList[i].name == product) {
        productId = productList[i].id!;
      }
    }
    print("product ID -----------> " + productId.toString());
    setProductDetails(productId);
    update();
  }

  setProductDetails(int productId) {
    int index = productList.indexWhere((item) => item.id == productId);
    tempProductPrice = productList[index].salePrice!;
    descriptionController.text = productList[index].description.toString();
    priceController.text = productList[index].salePrice.toString();
    taxController.text = productList[index].tax.toString();

    updateBottomDetailView(taxAmount: taxController.text);
  }
}
