import 'package:pie_chart/pie_chart.dart';

import '../../../configs/const.dart';
import '../../../widgets/common/custom_generate_dialog.dart';
import '../../../widgets/common/custom_select_view.dart';
import '../../../widgets/export_file.dart';
import '../controllers/pos_shop_pie_chart_controller.dart';

class ShopPosPieView extends StatelessWidget {
  final controller = Get.put(PosShopPieController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GetBuilder<PosShopPieController>(builder: (controller) {
            return posColletedAmountWidget(controller,false);
          }),
          GetBuilder<PosShopPieController>(builder: (controller) {
            return timeLineWidget(controller);
          }),

          SizedBox(height: 30.h,),


        ],
      ),
    );
  }

  timeLineWidget(PosShopPieController controller) {
    return Container(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
      color: Colors.white,
      child: Column(
        children: [
          showTimeLineWidget(controller, true),
          controller.amountPerShop == LocaleKeys.select_shop_to_view_pos_cat.tr
              ? amountTextWidget(controller, title: controller.amountPerShop)
              : controller.dashboardMethodPosList?.length != 0 &&controller.paymentMethodMap.isNotEmpty == true
                  ? pieChartByPaymentMethodWidget(
                      controller,
                    )
                  : amountTextWidget(controller,
                      title: LocaleKeys.no_data_found.tr),
        ],
      ),
    );
  }

  amountTextWidget(PosShopPieController controller, {title}) {
    return BiaText(
      title ?? "",
      align: TextAlign.center,
      color: AppColors.colorGreen,
      fontSize: 22.sp,
      textType: TextType.headLine6,
      fontWeight: FontWeight.w700,
      padding:
          EdgeInsets.only(left: 15.w, top: 15.h, right: 15.w, bottom: 10.h),
    );
  }

  showTimeLineWidget(PosShopPieController controller, bool isShop) {
    return Container(
      height: 40.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.timeModelList.value.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                if (controller.shopId == null) {
                  Get.showtoast(LocaleKeys.select_shop.tr);
                  return;
                } else if (controller.posShopId == null) {
                  Get.showtoast(LocaleKeys.select_POS.tr);
                  return;
                }
                int listLength = controller.timeModelList.length ?? 0;
                for (int i = 0; i < listLength; i++) {
                  if (i == index) {
                    controller.timeModelList.value[i].isSeleced = true;
                  } else {
                    controller.timeModelList.value[i].isSeleced = false;
                  }
                }
                controller.timeModelList.refresh();
                controller.update();

                if (controller.posTimeModelList.value[index].id == 1) {
                  controller.hitApiToGetShopPerPaymentCategory(
                      timeUrl: MERCHENT_COLLECT_TODAY_PAYMENT_CATEGORY_POS +
                          '${controller.shopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 2) {
                  controller.hitApiToGetShopPerPaymentCategory(timeUrl:MERCHENT_COLLECT_THIS_WEEK__PAYMENT_CATEGORY_POS +'${controller.shopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 3) {
                  controller.hitApiToGetShopPerPaymentCategory(                      timeUrl:
                          MERCHENT_COLLECT_SEVEN_DAYS__PAYMENT_CATEGORY_POS +
                              '${controller.shopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 4) {
                  controller.hitApiToGetShopPerPaymentCategory(
                      timeUrl:
                          MERCHENT_COLLECT_THIS_MONTH__PAYMENT_CATEGORY_POS +
                              '${controller.shopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 5) {
                  controller.hitApiToGetShopPerPaymentCategory(
                      timeUrl:
                          MERCHENT_COLLECT_LAST_MONTH__PAYMENT_CATEGORY_POS +
                              '${controller.shopId?.toString()}');
                }
              },
              child: Column(
                children: [
                  BiaText(
                    controller.timeModelList.value[index].title ?? "",
                    color:
                        controller.timeModelList.value[index].isSeleced == true
                            ? Colors.blue.withOpacity(0.8)
                            : Colors.grey.withOpacity(0.8),
                    fontSize: 20.sp,
                    padding: EdgeInsets.only(right: 15.w),
                  ),
                ],
              ),
            );
          })),
    );
  }

  pieChartByPaymentMethodWidget(PosShopPieController controller) {
    return PieChart(
      dataMap: controller.paymentMethodMap ?? {},
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(Get.context!).size.width / 3.2,
      colorList: controller.colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      ringStrokeWidth: 32,
      //centerText: "HYBRID",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }

  posColletedAmountWidget(PosShopPieController controller,bool isMethod) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
          color: AppColors.colorBlue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          headingTextWidget(
              title: isMethod==true?LocaleKeys.total_amount_collected_pos_pie_method.tr :LocaleKeys.total_amount_collected_pos_pie.tr),
          SizedBox(
            height: 20.h,
          ),
          headerWidget(controller, true),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  headingTextWidget({title}) {
    return BiaText(
      title ?? "",
      color: Colors.white,
      align: TextAlign.center,
      fontSize: 24.sp,
      textType: TextType.headLine6,
      fontWeight: FontWeight.w700,
      padding: EdgeInsets.zero,
    );
  }

  headerWidget(PosShopPieController controller, isShop) {
    return Row(
      children: [
        Expanded(child: shopSelectionDropWidget(controller, isShop)),
        SizedBox(
          width: 20.w,
        ),
        Expanded(flex: 2, child: posSelectionDropWidget(controller)),
        SizedBox(
          width: 20.w,
        ),
        Expanded(child: currencySelectionDropWidget(controller, isShop)),
      ],
    );
  }

  shopSelectionDropWidget(PosShopPieController controller, bool isShop) {
    return CustomSelectView(
      onTab: () {
        if (controller.merchentShopList?.value.length != 0) {
          showShopSelectionDialog(controller, isShop);
        } else {
          Get.showtoast(LocaleKeys.no_data_found.tr);
        }
      },
      label: isShop == true
          ? controller.selectedShopLabel
          : controller.selectPosShopLabel,
    );
  }

  currencySelectionDropWidget(PosShopPieController controller, bool isShop) {
    return CustomSelectView(
      onTab: () {
        if (controller.currencyList?.value.length != 0) {
          showCurrencySelectionDialog(controller, isShop);
        } else {
          Get.showtoast(LocaleKeys.no_data_found.tr);
        }
      },
      label: isShop == true
          ? controller.selectedCurrencyLabel
          : controller.selectedCurrencyPosLabel,
    );
  }

  showShopSelectionDialog(PosShopPieController controller, bool isShop) {
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
                            if (isShop == true) {
                              controller.selectedShopLabel = controller.merchentShopList?.value[index].name ?? "";
                              controller.shopId = controller.merchentShopList?.value[index].shopId ??"";
                              controller.merchentPosList?.clear();
                              controller.merchentPosList?.addAll(controller.merchentShopList?.value[index].merchantPOSList ?? []);
                              controller.merchentPosList?.refresh();
                            } else {
                              controller.selectPosShopLabel = controller.merchentShopList?.value[index].name ?? "";
                              controller.secShopId = controller.merchentShopList?.value[index].shopId ??"";

                            }

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

  showCurrencySelectionDialog(PosShopPieController controller, bool isShop) {
    return showGenerateDialog(
        context: Get.overlayContext!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: isShop == true
                    ? controller.currencyList.value.length
                    : controller.currencyPosList.value.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (isShop == true) {
                        controller.selectedCurrencyLabel =
                            controller.currencyList.value[index] ?? "";
                        controller.filterBaseOnCategory(controller.dashBoardCategoryModel);
                      } else {
                        controller.selectedCurrencyPosLabel =
                            controller.currencyPosList.value[index] ?? "";
                        controller.filterDataBasedOnPosCurrency();
                      }
                      controller.update();
                      Get.back();
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.h, bottom: 10.h),
                      child: BiaText(
                          isShop == true
                              ? controller.currencyList.value[index] ?? ""
                              : controller.currencyPosList.value[index] ?? "",
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                })
            //your content
          ],
        ));
  }

  posSelectionDropWidget(PosShopPieController controller) {
    return CustomSelectView(
      onTab: () {
        if (controller.merchentPosList?.value.length != 0) {
          showPosSelectionDialog(controller);
        } else {
          Get.showtoast(LocaleKeys.no_data_found.tr);
        }
      },
      label: controller.selectedPosLabel,
    );
  }

  showPosSelectionDialog(PosShopPieController controller) {
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
                            controller.posShopId =
                                controller.merchentPosList?.value[index].id ??
                                    "";
                            controller.update();
                            Get.back();
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
