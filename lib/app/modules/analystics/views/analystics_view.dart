import 'dart:ui';

import 'package:biapay_app/app/modules/analystics/widget/chart_widget.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../configs/const.dart';
import '../../../widgets/common/custom_generate_dialog.dart';
import '../../../widgets/common/custom_select_view.dart';
import '../controllers/analystics_controller.dart';

class AnalysticsView extends GetView<AnalysticsController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AnalysticsController());
    return BiaScaffold(
      drawer: Menu.demo(context),
      appBar: BiaAppBar(
        showAction: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          GetBuilder<AnalysticsController>(builder: (controller) {
            return shopColletedAmountWidget(controller);
          }),
          GetBuilder<AnalysticsController>(builder: (controller) {
            return timeLineWidget(controller);
          }),
          SizedBox(
            height: 20.h,
          ),
          GetBuilder<AnalysticsController>(builder: (controller) {
            return posColletedAmountWidget(controller);
          }),
          GetBuilder<AnalysticsController>(builder: (controller) {
            return timeLinePosWidget(controller);
          }),
        ],
      ),
    );
  }

  shopColletedAmountWidget(AnalysticsController controller) {
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
          headingTextWidget(title: LocaleKeys.total_amount_collected.tr),
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

  timeLineWidget(AnalysticsController controller) {
    return Container(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
      color: Colors.white,
      child: Column(
        children: [
          showTimeLineWidget(controller, true),
          controller.amountPerShop == LocaleKeys.select_shop_to_view.tr
              ? amountTextWidget(controller, title: controller.amountPerShop)
              : controller.dashBoardItemList?.length != 0
                  ? showTotalAmountWidget(controller,
                      title: controller.amountPerShop)
                  : amountTextWidget(controller,
                      title: LocaleKeys.no_data_found.tr),
        ],
      ),
    );
  }

  headerWidget(AnalysticsController controller, isShop) {
    return Row(
      children: [
        Expanded(child: shopSelectionDropWidget(controller, isShop)),
        SizedBox(
          width: 20.w,
        ),
        isShop == false
            ? Expanded(flex: 2, child: posSelectionDropWidget(controller))
            : Container(),
        isShop == false
            ? SizedBox(
                width: 20.w,
              )
            : Container(),
        Expanded(child: currencySelectionDropWidget(controller, isShop)),
      ],
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

  shopSelectionDropWidget(AnalysticsController controller, bool isShop) {
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

  posSelectionDropWidget(AnalysticsController controller) {
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

  currencySelectionDropWidget(AnalysticsController controller, bool isShop) {
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

  showShopSelectionDialog(AnalysticsController controller, bool isShop) {
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
                              controller.selectedShopLabel = controller
                                      .merchentShopList?.value[index].name ??
                                  "";
                              controller.shopId = controller
                                      .merchentShopList?.value[index].shopId ??
                                  "";
                            } else {
                              controller.selectPosShopLabel = controller
                                      .merchentShopList?.value[index].name ??
                                  "";
                              controller.secShopId = controller
                                      .merchentShopList?.value[index].shopId ??
                                  "";
                              controller.merchentPosList?.clear();
                              controller.merchentPosList?.addAll(controller
                                      .merchentShopList
                                      ?.value[index]
                                      ?.merchantPOSList ??
                                  []);
                              controller.merchentPosList?.refresh();
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

  showCurrencySelectionDialog(AnalysticsController controller, bool isShop) {
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
                        controller.filterDataBasedOnCurrency();
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

  showTimeLineWidget(AnalysticsController controller, bool isShop) {
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

                if (controller.timeModelList.value[index].id == 1) {
                  controller.hitApiToGetDashBoardForShop(
                      timeUrl: MERCHENT_DASHBOARD_COLLECT_TODAY +
                          '${controller.shopId?.toString()}');
                } else if (controller.timeModelList.value[index].id == 2) {
                  controller.hitApiToGetDashBoardForShop(
                      timeUrl: MERCHENT_DASHBOARD_COLLECT_THIS_WEEK +
                          '${controller.shopId?.toString()}');
                } else if (controller.timeModelList.value[index].id == 3) {
                  controller.hitApiToGetDashBoardForShop(
                      timeUrl: MERCHENT_DASHBOARD_COLLECT_SEVEN_DAYS +
                          '${controller.shopId?.toString()}');
                } else if (controller.timeModelList.value[index].id == 4) {
                  controller.hitApiToGetDashBoardForShop(
                      timeUrl: MERCHENT_DASHBOARD_COLLECT_THIS_MONTH +
                          '${controller.shopId?.toString()}');
                } else if (controller.timeModelList.value[index].id == 5) {
                  controller.hitApiToGetDashBoardForShop(
                      timeUrl: MERCHENT_DASHBOARD_COLLECT_LAST_MONTH +
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

  amountTextWidget(AnalysticsController controller, {title}) {
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

  showTotalAmountWidget(AnalysticsController controller, {title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BiaText(
          title ?? "",
          align: TextAlign.center,
          color: AppColors.colorBlue,
          fontSize: 30.sp,
          textType: TextType.headLine6,
          fontWeight: FontWeight.w800,
          padding: EdgeInsets.only(
            left: 15.w,
            top: 15.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: BiaText(
            controller.selectedCurrencyLabel ?? "",
            align: TextAlign.center,
            color: AppColors.colorGreen,
            fontSize: 20.sp,
            textType: TextType.headLine6,
            fontWeight: FontWeight.bold,
            padding: EdgeInsets.only(top: 15.h, right: 15.w),
          ),
        )
      ],
    );
  }

  /*----view for pos and handling of all methods*/

  posColletedAmountWidget(AnalysticsController controller) {
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
          headingTextWidget(title: LocaleKeys.total_amount_collected_pos.tr),
          SizedBox(
            height: 20.h,
          ),
          headerWidget(controller, false),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  showPosSelectionDialog(AnalysticsController controller) {
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

  timeLinePosWidget(AnalysticsController controller) {
    return Container(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
      color: Colors.white,
      child: Column(
        children: [
          showPosLineWidget(controller),
          controller.amountPerPos == LocaleKeys.select_pos_to_view.tr
              ? amountPosTextWidget(controller, title: controller.amountPerPos)
              : controller.dashBoardPosItemList?.length != 0
                  ? showTotalAmountPosWidget(controller,
                      title: controller.amountPerPos)
                  : amountPosTextWidget(controller,
                      title: LocaleKeys.no_data_found.tr),
        ],
      ),
    );
  }

  showPosLineWidget(AnalysticsController controller) {
    return Container(
      height: 40.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.posTimeModelList.value.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                if (controller.secShopId == null) {
                  Get.showtoast(LocaleKeys.select_shop.tr);
                  return;
                } else if (controller.posShopId == null) {
                  Get.showtoast(LocaleKeys.select_POS.tr);
                  return;
                }

                int listLength = controller.posTimeModelList.length ?? 0;
                for (int i = 0; i < listLength; i++) {
                  if (i == index) {
                    controller.posTimeModelList.value[i].isSeleced = true;
                  } else {
                    controller.posTimeModelList.value[i].isSeleced = false;
                  }
                }
                controller.posTimeModelList.refresh();
                controller.update();

                if (controller.posTimeModelList.value[index].id == 1) {
                  controller.hitApiToGetDashBoardForPos(
                      timeUrl: MERCHENT_DASHBOARD_COLLECT_TODAY_POS +
                          '${controller.posShopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 2) {
                  controller.hitApiToGetDashBoardForPos(
                      timeUrl: MERCHENT_DASHBOARD_COLLECT_THIS_WEEK_POS +
                          '${controller.posShopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 3) {
                  controller.hitApiToGetDashBoardForPos(
                      timeUrl: MERCHENT_DASHBOARD_COLLECT_SEVEN_DAYS_POS +
                          '${controller.posShopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 4) {
                  controller.hitApiToGetDashBoardForPos(
                      timeUrl: MERCHENT_DASHBOARD_COLLECT_THIS_MONTH_POS +
                          '${controller.posShopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 5) {
                  controller.hitApiToGetDashBoardForPos(
                      timeUrl: MERCHENT_DASHBOARD_COLLECT_LAST_MONTH_POS +
                          '${controller.posShopId?.toString()}');
                }
              },
              child: Column(
                children: [
                  BiaText(
                    controller.posTimeModelList.value[index].title ?? "",
                    color: controller.posTimeModelList.value[index].isSeleced ==
                            true
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

  amountPosTextWidget(AnalysticsController controller, {title}) {
    return BiaText(
      title ?? "",
      align: TextAlign.center,
      color: AppColors.colorGreen,
      fontSize: 22.sp,
      textType: TextType.headLine6,
      fontWeight: FontWeight.w700,
      padding:
          EdgeInsets.only(left: 15.w, top: 15.h, right: 15.w, bottom: 20.h),
    );
  }

  showTotalAmountPosWidget(AnalysticsController controller, {title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BiaText(
          title ?? "",
          align: TextAlign.center,
          color: AppColors.colorBlue,
          fontSize: 30.sp,
          textType: TextType.headLine6,
          fontWeight: FontWeight.w800,
          padding: EdgeInsets.only(
            left: 15.w,
            top: 15.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: BiaText(
            controller.selectedCurrencyLabel ?? "",
            align: TextAlign.center,
            color: AppColors.colorGreen,
            fontSize: 20.sp,
            textType: TextType.headLine6,
            fontWeight: FontWeight.bold,
            padding: EdgeInsets.only(top: 15.h, right: 15.w),
          ),
        )
      ],
    );
  }
}

/*
 old client provided view
 ListView(
        children: [
          ChartWidget(
              title: "Time period",
              topRightWidgets: [
                SizedBox(
                  width: 180.w,
                  child: BiaDropdown<String>(
                      options: controller.currencies,
                      showBorder: true,
                      outerLabel: false,
                      controller: controller.currency1,
                      hint: 'Currency',
                      displayName: (v) => v,
                      onSelected: (v) {}),
                ),
              ],
              chartData: const {
                'xAxis': {
                  'type': 'category',
                  'boundaryGap': false,
                  'data': [
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '10',
                    '11',
                    '12',
                    '13',
                    '14',
                  ]
                },
                'yAxis': {'type': 'value'},
                'series': [
                  {
                    'data': [
                      0,
                      10,
                      100,
                      150,
                      180,
                      200,
                      180,
                      180,
                      180,
                      200,
                      50,
                      40,
                      180,
                      200,
                    ],
                    'type': 'line',
                    'color': '#A4E0F7',
                    'smooth': true,
                    'areaStyle': {}
                  }
                ]
              },
              label: 'Last 90 days'),
          ChartWidget(
              title: "Time period",
              topRightWidgets: [
                SizedBox(
                  width: 180.w,
                  child: BiaDropdown<String>(
                      options: controller.currencies,
                      showBorder: true,
                      outerLabel: false,
                      controller: controller.currency2,
                      hint: 'Currency',
                      displayName: (v) => v,
                      onSelected: (v) {}),
                ),
              ],
              chartData: const {
                'xAxis': {
                  'type': 'category',
                  'data': [
                    'Shop1',
                    'Shop2',
                    'Shop3',
                    'Shop4',
                    'Shop5',
                  ]
                },
                'yAxis': {'type': 'value'},
                'color': '#A4E0F7',
                'series': [
                  {
                    'data': [120, 200, 150, 80, 70, 110, 130],
                    'type': 'bar'
                  }
                ]
              },
              label: 'Amount collected - Total per shop'),
          ChartWidget(
              title: "Time period",
              topRightWidgets: [
                SizedBox(
                  width: 180.w,
                  child: BiaDropdown<String>(
                      options: controller.currencies,
                      showBorder: true,
                      outerLabel: false,
                      controller: controller.currency3,
                      hint: 'Currency',
                      displayName: (v) => v,
                      onSelected: (v) {}),
                ),
              ],
              chartData: const {
                'series': [
                  {
                    'type': 'pie',
                    'radius': [20, 100],
                    'roseType': 'area',
                    'data': [
                      {'value': 20, 'name': 'Master card - 20%'},
                      {'value': 15, 'name': 'Orange money - 15%'},
                      {'value': 25, 'name': 'Visa - 25%'},
                      {'value': 10, 'name': 'MTN MoMo - 10%'},
                      {'value': 5, 'name': 'Bank transfer - 5%'},
                      {'value': 15, 'name': 'Union pay - 15%'},
                      {'value': 10, 'name': 'Eu money - 10%'},
                    ]
                  }
                ]
              },
              label: 'Payment methids - Total %'),
          ChartWidget(
              title: "Time period",
              topRightWidgets: [
                SizedBox(
                  width: 180.w,
                  child: BiaDropdown<String>(
                      options: controller.currencies,
                      showBorder: true,
                      outerLabel: false,
                      controller: controller.currency4,
                      hint: 'Currency',
                      displayName: (v) => v,
                      onSelected: (v) {}),
                ),
              ],
              chartData: const {
                'xAxis': {
                  'type': 'category',
                  'data': [
                    '01/06',
                    '02/06',
                    '03/06',
                    '04/06',
                    '05/06',
                    '06/06',
                    '07/06',
                    '08/06',
                    '09/06',
                    '10/06',
                  ]
                },
                'yAxis': {'type': 'value'},
                'color': '#A4E0F7',
                'series': [
                  {
                    'data': [50, 70, 110, 15, 140, 160, 130, 140, 210, 180],
                    'type': 'bar'
                  }
                ]
              },
              label: 'Amount collected - Total last 30 days'),
        ],
      )*/
