import 'package:auto_size_text/auto_size_text.dart';

import '../../../configs/assets.dart';
import '../../../configs/const.dart';
import '../../../models/merchent_shop_model.dart';
import '../../../models/merchent_subscription_model.dart';
import '../../../widgets/export_file.dart';
import '../controllers/merchant_profile_dash_controller.dart';
 
class MerchantProfileDashView extends StatelessWidget {
  var controller = Get.put(MerchantProfileDashController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        GetBuilder<MerchantProfileDashController>(builder: (controller) {
          return shopInformationMainWidget(controller);
        })
      ],
    );
  }

  shopInformationMainWidget(MerchantProfileDashController controller) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          color: AppColors.colorWhite),
      child: Column(
        children: [
          mainHeaderWidget(),
          SizedBox(
            height: 20.h,
          ),
          userProfileWidget(controller),
          SizedBox(
            height: 10.h,
          ),
          userNameWidget(controller),
          userInformationWidget(controller),
          SizedBox(
            height: 10.h,
          ),
          locationButtomWidget(),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  mainHeaderWidget() {
    return Container(
        width: Get.width,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r)),
            color: AppColors.colorBlue),
        child: headingTextWidget(
          title: LocaleKeys.merchant_info.tr,
        ));
  }

  userProfileWidget(MerchantProfileDashController controller) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child:controller.uint8list==null?Image.asset(Assets.scanPay,height: 150.h,width: 150.w):Image.memory(controller.uint8list!,height: 150.h,width: 150.w),

    );
  }

  userNameWidget(MerchantProfileDashController controller) {
    return BiaText(
      "INGRID",
      fontWeight: FontWeight.bold,
    );
  }

  userInformationWidget(MerchantProfileDashController controller) {
    return Column(
      children: [
        merhchantInfo(LocaleKeys.user_id_number.tr, controller.merchentProfile?.merchantProfile?.merchant?.merchantName??""),
        merhchantInfo(LocaleKeys.user_phn_number.tr, controller.merchentProfile?.merchantProfile?.merchant?.phoneNo?.toString()??""),
        merhchantInfo(
            LocaleKeys.email_address.tr, controller.merchentProfile?.merchantProfile?.merchant?.email??""),
        merhchantInfo(LocaleKeys.geo_localisation.tr, ''),
      ],
    );
  }

  locationButtomWidget() {
    return Container(
      width: Get.width / 2.5,
      padding: EdgeInsets.all(15.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.h),
          color: AppColors.colorGreen),
      child: BiaText(
        LocaleKeys.see_location.tr,
        fontSize: 20.h,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget merhchantInfo(String title, String info) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, left: 10.h, right: 10.h),
      padding: EdgeInsets.only(left: 10.h, right: 10.h, bottom: 15.h, top: 2.h),
      decoration: BoxDecoration(
          border: Border(
              bottom: title == "Geo localisation​:"
                  ? BorderSide.none
                  : BorderSide(width: 0.2, color: Colors.green))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        BiaText(
          title,
          fontSize: 19.h,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
        BiaText(
          info,
          fontSize: 19.h,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ]),
    );
  }

  headingTextWidget({
    title,
  }) {
    return BiaText(
      title ?? "",
      color: Colors.white,
      align: TextAlign.center,
      fontSize: 24.sp,
      textType: TextType.headLine6,
      fontWeight: FontWeight.w500,
      padding: EdgeInsets.zero,
    );
  }
}
