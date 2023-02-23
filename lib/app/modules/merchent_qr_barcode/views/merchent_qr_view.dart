import 'package:biapay_app/app/widgets/helper_widget.dart';

import '../../../models/merchent_shop_model.dart';
import '../../../models/security_model.dart';
import '../../../widgets/common/bia_custom_model_dropdown.dart';
import '../../../widgets/common/custom_generate_dialog.dart';
import '../../../widgets/common/custom_select_view.dart';
import '../../../widgets/common/pos_dropdown.dart';
import '../../../widgets/export_file.dart';
import '../controllers/merchent_qr_controller.dart';

class MerchentQrView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        resizeToAvoidBottomInset: false,
        appBar: BiaAppBar(
          centerTitle: false,
          showAction: false,
          showIcon: true,
        ),
        body: GetBuilder<MerchentQrController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                headingTextWidget(title: LocaleKeys.select_shop.tr),
                SizedBox(
                  height: 10.h,
                ),
                shopSelectionDropWidget(controller),
                SizedBox(
                  height: 13.h,
                ),
                headingTextWidget(title: LocaleKeys.select_a_pos.tr),
                SizedBox(
                  height: 10.h,
                ),
                shopPosSelectionDropWidget(controller),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                controller.qrCodeImage != null
                    ? qrCodeImageWidget(controller)
                    : Container(),
                SizedBox(
                  height: 20.h,
                ),
                controller.barCodeImage != null
                    ? barCodeImageWidget(controller)
                    : Container(),
              ],
            );
          },
        ));
  }

  headingTextWidget({title}) {
    return BiaText(
      title ?? "",
      color: Colors.white,
      align: TextAlign.center,
      fontSize: 20.sp,
      fontWeight: FontWeight.w300,
      textType: TextType.headLine6,
      padding: EdgeInsets.zero,
    );
  }

  shopSelectionDropWidget(MerchentQrController controller) {
    return CustomSelectView(
      padding: EdgeInsets.all(18.r),
      onTab: () {
        showShopSelectionDialog(controller, true);
      },
      label: controller.selectedShopLabel.tr,
    );
  }

  showShopSelectionDialog(MerchentQrController controller, bool isShop) {
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
                            controller.shopId = controller
                                    .merchentShopList?.value[index].shopId
                                    ?.toString() ??
                                "";
                            controller.merchentPosList?.clear();
                            controller.merchentPosList?.addAll(controller
                                    .merchentShopList
                                    ?.value[index]
                                    .merchantPOSList ??
                                []);
                            controller.merchentPosList?.refresh();
                            controller.qrCodeImage = null;
                            controller.barCodeImage = null;
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

  shopPosSelectionDropWidget(MerchentQrController controller) {
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

  showPosSelectionDialog(MerchentQrController controller) {
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
                            controller.selectedPosLabel =controller.merchentPosList?.value[index].name ??"";
                            Get.back();
                            controller.hitApiToGetMerchentQrCode(controller.merchentPosList?.value[index].uuid);
                            controller.qrCodeImage = null;
                            controller.barCodeImage = null;
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

  qrCodeImageWidget(MerchentQrController controller) {
    return Center(
      child: Image.memory(
        controller.qrCodeImage!,
        height: 300.h,
        width: 300.w,
        fit: BoxFit.fill,
      ),
    );
  }

  barCodeImageWidget(MerchentQrController controller) {
    return Image.memory(
      controller.barCodeImage!,
      height: 170.h,
      width: Get.width,
      fit: BoxFit.fill,
    );
  }
}
