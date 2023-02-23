

import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RequestMoneyController extends GetxController {

  var paymentMethodController=TextEditingController();
  List testList=["Usd"];

  List<String>? mlist=[LocaleKeys.send_money.tr,LocaleKeys.request_money.tr,LocaleKeys.pay_link.tr];
  int length=3;
  //TODO: Implement KycController

}