import '../../../../../widgets/export_file.dart';

class AddCouponController extends GetxController {
  final name = TextEditingController();
  final discount = TextEditingController();
  final type = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  final maxNoOfUser = TextEditingController();
  final status = TextEditingController();

  Map<String, dynamic> fields = {};

  setCouponMap(){

    fields["name"] = name.text;

    type.text == "%"
        ? fields["couponType"] = "PERCENTAGE"
        : fields["couponType"] = "FIXED";
    fields["couponStatus"] = status.text.toUpperCase();
    fields["amount"] = int.parse(discount.text);
    fields["startDate"] = startDate.text + " 00:00";
    fields["endDate"] = endDate.text + " 00:00";
    fields["maxUsage"] = int.parse(maxNoOfUser.text);
    fields["currentUsage"] = 0;
    fields["merchantId"] = 195; // merchantId from GetUserProfile

    print("params : ------------ >" + fields.toString());

    createCouponApi();
  }

  createCouponApi() async {
    hidekeyboard();
    Get.showLoader();
    await userProvider.createCoupon(data: fields).then((value) {
      Get.closeLoader();
      if (value != null) {
        print("coupon created ------>> ");
        print(value.toString());
        Get.back(result: "returned");
      }
    }).onError((error, stackTrace) {
      print("coupon error ------>> ");
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}