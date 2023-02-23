import 'package:auto_size_text/auto_size_text.dart';

import '../../../configs/const.dart';
import '../../../models/merchent_shop_model.dart';
import '../../../widgets/export_file.dart';
import '../controllers/shop_information_controller.dart';

class ShopInformationView extends StatelessWidget {
  var controller = Get.put(ShopViewController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<ShopViewController>(builder: (controller) {
          return shopInformationMainWidget(controller);
        }),
        mainHeaderTitleWidget(),
        GetBuilder<ShopViewController>(builder: (controller) {
          return shopListViewBuilder(controller);
        }),

        GetBuilder<ShopViewController>(builder: (controller) {
          return  controller.listLength>5? viewMoreWidget():Container();
        }),

      ],
    );
  }

  shopInformationMainWidget(ShopViewController controller) {
    return Container(
        width: Get.width,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r)),
            color: AppColors.colorBlue),
        child: headingTextWidget(
          title: LocaleKeys.shop_information.tr,
        ));
  }

  mainHeaderTitleWidget() {
    return Container(
      padding: EdgeInsets.all(13.h),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: headingTitleWidget(title: LocaleKeys.name_shop.tr),
          ),
          Expanded(
            child: headingTitleWidget(title: LocaleKeys.date_of_activation.tr),
          ),
          Expanded(
            child: headingTitleWidget(title: LocaleKeys.shop_status.tr),
          ),
        ],
      ),
    );
  }

  headingTitleWidget({title}) {
    return Center(
      child: AutoSizeText(
        title ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
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

  shopListViewBuilder(ShopViewController controller) {
     return Container(
      color: Colors.white,
      child: ListView.separated(
          separatorBuilder: ((context, index) {
            return Divider(
              color: Colors.grey,
              thickness: 0.5.h,
            );
          }),
          shrinkWrap: true,
          itemCount:
              controller.listLength > 5 ? 5 : controller.merchentShopList?.value.length ?? 0,
          itemBuilder: ((context, index) {
            return listItemWidget(controller.merchentShopList![index]);
          })),
    );
  }

  viewMoreWidget() {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.4.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          InkWell(
            onTap: (){
              Get.toNamed(Routes.ALL_SHOP_INFORMATION_VIEW);
            },
            child: BiaText(
              LocaleKeys.view_more.tr,
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

        ],
      ),
    );
  }

  listItemWidget(MerchentShopDataModel? merchentShopDataModel) {
    return Container(
      padding: EdgeInsets.all(13.h),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: headingItemTitleWidget(
                title: merchentShopDataModel?.name ?? ""),
          ),
          Expanded(
            child: headingItemTitleWidget(title: ""),
          ),
          Expanded(
            child: headingItemTitleWidget(
                title: merchentShopDataModel?.status != null &&
                        merchentShopDataModel?.status == true
                    ? LocaleKeys.active.tr
                    : LocaleKeys.in_active.tr,
                colors: merchentShopDataModel?.status != null &&
                        merchentShopDataModel?.status == true
                    ? Colors.green
                    : Colors.red),
          ),
        ],
      ),
    );
  }

  headingItemTitleWidget({title, colors}) {
    return Center(
      child: AutoSizeText(
        title ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colors ?? Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
