import 'package:biapay_app/app/modules/profile_settlement/views/settlement_component.dart';
import 'package:biapay_app/app/widgets/helper_widget.dart';
import 'package:excel/excel.dart';

import '../../../widgets/common/custom_generate_dialog.dart';
import '../../../widgets/common/custom_select_view.dart';
import '../../../widgets/export_file.dart';
import '../controllers/add_account_controller.dart';
import '../controllers/profile_settlement_controller.dart';

class AddAccountView extends StatelessWidget {
  var controller = Get.put(AddAccountController());

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        resizeToAvoidBottomInset: false,
        appBar: BiaAppBar(
          centerTitle: false,
          showAction: false,
          showIcon: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            GetBuilder<AddAccountController>(
              builder: (controller) {
                return shopPostWidget(controller);
              },
            ),

          ],
        ));
  }
  shopPostWidget(AddAccountController controller) {
    return Row(
      children: [
        Expanded(child: shopSelectionDropWidget(controller)),
        SizedBox(
          width: 15.w,
        ),
        Expanded(child: shopPosSelectionDropWidget(controller)),
      ],
    );
  }


  shopSelectionDropWidget(AddAccountController controller) {
    return CustomSelectView(
      padding: EdgeInsets.all(18.r),
      onTab: () {
        showShopSelectionDialog(controller, true);
      },
      label: controller.selectedShopLabel.tr,
    );
  }

  showShopSelectionDialog(AddAccountController controller, bool isShop) {
    return showGenerateDialog(
        context: Get.overlayContext!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.merchentShopList?.value.length,
                itemBuilder: (context, index) {
                  return controller.merchentShopList?.value[index].name
                      ?.isNotEmpty ==
                      true
                      ? InkWell(
                    onTap: () {
                      controller.selectedShopLabel = controller
                          .merchentShopList?.value[index].name ??
                          "";

                      controller.merchentPosList?.clear();
                      controller.merchentPosList?.addAll(controller
                          .merchentShopList
                          ?.value[index]
                          .merchantPOSList ??
                          []);
                      controller.merchentPosList?.refresh();

                      controller.update();
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 20.h, bottom: 10.h),
                      child: BiaText(
                          controller
                              .merchentShopList?.value[index].name ??
                              "",
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                      : Container();
                })
            //your content
          ],
        ));
  }

  shopPosSelectionDropWidget(AddAccountController controller) {
    return CustomSelectView(
      padding: EdgeInsets.all(18.r),
      onTab: () {
        if (controller.merchentPosList?.length != 0)
          showPosSelectionDialog(controller);
        else if (controller.selectedShopLabel == LocaleKeys.select_shop.tr) {
          Get.showtoast(LocaleKeys.select_shop.tr);
        } else {
          Get.showtoast(LocaleKeys.no_data_found.tr);
        }
      },
      label: controller.selectedPosLabel.tr,
    );
  }

  showPosSelectionDialog(AddAccountController controller) {
    return showGenerateDialog(
        context: Get.overlayContext!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.merchentPosList?.value.length,
                itemBuilder: (context, index) {
                  return controller
                      .merchentPosList?.value[index].name?.isNotEmpty ==
                      true
                      ? InkWell(
                    onTap: () {
                      controller.selectedPosLabel =
                          controller.merchentPosList?.value[index].name ??
                              "";
                      Get.back();
                      controller.update();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 20.h, bottom: 10.h),
                      child: BiaText(
                          controller.merchentPosList?.value[index].name ??
                              "",
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                      : Container();
                })
            //your content
          ],
        ));
  }



}
