import 'package:biapay_app/app/models/country_state_model.dart';
import 'package:biapay_app/app/models/currency_model.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';

class AddCustomerController extends GetxController {

  // ------ CURRENCY
  RxList<CurrencyModel> currencyList = <CurrencyModel>[].obs;
  RxList currencyElementList = [].obs;
  int currencyId = 0;

  // ------ COUNTRY
  RxList<Country> countryList = <Country>[].obs;
  RxList countryElementList = [].obs;

  // ------ STATES
  RxList<States> stateList = <States>[].obs;
  RxList stateElementList = [].obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      onLoad();
    });
    super.onInit();
  }

  onLoad() {
    getCurrencies();
  }

  final gender = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final mobileNumber = TextEditingController();
  final emailId = TextEditingController();
  final reference = TextEditingController();
  final address1 = TextEditingController();
  final address2 = TextEditingController();
  final currency = TextEditingController();
  final city = TextEditingController();
  final country = TextEditingController();
  final state = TextEditingController();
  final zipCode = TextEditingController();
  final taxRate = TextEditingController();
  final website = TextEditingController();

  String countryCode = "+1";

  Map<String, dynamic> fields = {};

  setCustomerMap(){

    fields["firstName"] = firstName.text;
    fields["lastName"] = lastName.text;
    fields["addressLine1"] = address1.text;
    fields["addressLine2"] = address2.text;
    fields["city"] = city.text;
    fields["state"] = state.text;
    fields["country"] = country.text;
    fields["postcode"] = zipCode.text;
    fields["email"] = emailId.text;
    fields["phoneNumber"] = mobileNumber.text;
    fields["reference"] = reference.text;
    fields["website"] = website.text;
    fields["taxRate"] = taxRate.text;
    fields["currencyId"] = currencyId;
    fields["merchantId"] = 195; // merchantId from GetUserProfile

    print("params : ------------ >");
    print(fields);

    createCustomerApi();
  }

  createCustomerApi() async {
    hidekeyboard();
    Get.showLoader();
    await userProvider.createCustomer(data: fields).then((value) {
      Get.closeLoader();
      if (value != null) {
        print("customer created ------>> ");
        print(value.toString());
        Get.back(result: "returned");
      }
    }).onError((error, stackTrace) {
      print("customer error ------>> ");
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }


}

// ------------------------------------------------------------------------- CURRENCY
extension getCurrency on AddCustomerController {
  getCurrencies() async {
    Get.showLoader();
    await userProvider.currencyListApiCall().then((value) {
      if (value != null) {
        currencyList.addAll(value);
        currencyList.refresh();
        update();
        filterListWithStatus();
        getCountries();
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

// ------------------------------------------------------------------------- COUNTRY_STATES
extension getCountry on AddCustomerController {
  getCountries() async {
    await userProvider.countryListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        CountryStateModel model = value;
        countryList.addAll(model.countries!.toList());
        countryList.refresh();
        update();
        filterList();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterList() {
    if (countryList.value.length != 0) {
      countryList.forEach((element) {
        countryElementList.add(element.name);
      });
      currencyList.refresh();
      update();
    }
  }

  setStateListWithSelectedCountry(String country){
    if (stateList != null) {
      stateList.clear();
      stateElementList.clear();
    }
    int index = countryList.indexWhere((item) => item.name == country);
    countryList[index].states!.forEach((element) {
      stateList.add(element);
    });
    stateList.forEach((element) {
      stateElementList.add(element.name);
    });
    stateList.refresh();
    update();
  }

  getSelectedState(String selectedState) {
    print("state-------- > " + selectedState);
  }
}

/*
{
    "firstName" : "Ramanan",
    "lastName" : "Sharma",
    "addressLine1" : "Galle Road",
    "addressLine2" : "Colombo 1",
    "city" : "Colombo",
    "state" : "Western",
    "postcode" : "00100",
    "country" : "Sri Lanka",
    "email" : "ramanan@ramanan.info",
    "phoneNumber" : "94777652225",
    "reference" : "001",
    "website" : "www.niogin.com",
    "taxRate" : 5.0,
    "currencyId" : 1,
    "merchantId" : 2
}
 */