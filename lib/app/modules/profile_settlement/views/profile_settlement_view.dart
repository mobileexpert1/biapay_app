import 'package:biapay_app/app/modules/profile_settlement/views/settlement_component.dart';
import 'package:biapay_app/app/widgets/helper_widget.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:excel/excel.dart';

import '../../../models/merchent_shop_model.dart';
import '../../../widgets/common/bia_dialogue.dart';
import '../../../widgets/common/custom_generate_dialog.dart';
import '../../../widgets/common/custom_select_view.dart';
import '../../../widgets/export_file.dart';
import '../controllers/profile_settlement_controller.dart';

class ProfileSettlementView extends StatelessWidget {
  var controller = Get.put(ProfileSettlementController());

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
            serachTextWidget(),
            SizedBox(
              height: 20.h,
            ),
            GetBuilder<ProfileSettlementController>(builder: (controller) {
              return shopPostWidget(controller);
            }),

            addNewAccountWidget(),
            Expanded(child: settleListBuilderWidget())
          ],
        ));
  }

  shopPostWidget(ProfileSettlementController controller) {
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


  shopSelectionDropWidget(ProfileSettlementController controller) {
    return CustomSelectView(
      padding: EdgeInsets.all(18.r),
      onTab: () {
        showShopSelectionDialog(controller, true);
      },
      label: controller.selectedShopLabel.tr,
    );
  }

  showShopSelectionDialog(ProfileSettlementController controller, bool isShop) {
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

  shopPosSelectionDropWidget(ProfileSettlementController controller) {
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

  showPosSelectionDialog(ProfileSettlementController controller) {
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

  addNewAccountWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BiaText(
          LocaleKeys.list.tr,
          fontSize: 25.h,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        TextButton(
            onPressed: () {
              Get.toNamed(Routes.MERCHENT_ADD_SETTLEMENT);
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 35.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                BiaText(
                  LocaleKeys.add_update_account.tr,
                  fontSize: 22.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )
              ],
            )),
      ],
    );
  }

  customerItemTxtWidget({String? text}) {
    return BiaText(
      text ?? "asdhgahdgas",
      align: TextAlign.start,
      fontSize: 23.sp,
      padding: EdgeInsets.only(left: 0.0),
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  customShopListWidget(ProfileSettlementController controller) {
    return Obx(
      () {
        return Visibility(
          visible: controller.isShopvisible.value,
          child: Container(
            height: 200.h,
            margin: EdgeInsets.only(top: 110.h),
            color: Colors.white,
            child: ListView.builder(
                itemCount: controller.merchentShopList?.value.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return controller.merchentShopList?[index].name != ""
                      ? InkWell(
                          onTap: () {
                            controller.changeShopVisibilty();
                            controller.merchentShopController.text =
                                controller.merchentShopList?[index].name ?? "";
                            controller.merchentPosList!.clear();
                            controller.merchentPosList?.addAll(controller
                                    .merchentShopList?[index].merchantPOSList ??
                                []);
                            controller.merchentPosList!.refresh();
                            controller.update();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              customerItemTxtWidget(
                                  text: controller
                                          .merchentShopList?[index].name ??
                                      ""),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          color: Colors.green,
                          height: 0,
                        );
                }),
          ),
        );
      },
    );
  }



  serachTextWidget() {
    return BiaTextField(
      hint: LocaleKeys.search_records.tr,
      label: "",
      padding: EdgeInsets.zero,
      onChanged: (data) {},
      suffixIcon: Icon(Icons.search),
      controller: controller.searchController,
    );
  }

  settleListBuilderWidget() {
    return ListView.builder(
        itemCount: 0,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SettleMentComponent();
        });
  }
}
