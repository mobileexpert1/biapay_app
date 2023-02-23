import 'package:biapay_app/app/models/dashboard_pie_chart.dart';
import 'package:biapay_app/app/models/merchant_summary_model.dart';
import 'package:biapay_app/app/modules/dashboard/chart/top_up/top_up_screen.dart';
import 'package:biapay_app/app/modules/dashboard/views/dashboard_user_view.dart';
import 'package:biapay_app/app/modules/dashboard/views/pos_shop_pie_chart_method_view.dart';
import 'package:biapay_app/app/modules/dashboard/views/pos_shop_pie_chart_view.dart';
import 'package:biapay_app/app/modules/dashboard/views/shop_information_view.dart';
import 'package:biapay_app/app/modules/dashboard/views/subscription_information_view.dart';
import 'package:biapay_app/app/modules/pricing/sub_menu_billing/view/billing_view.dart';
import 'package:biapay_app/app/modules/profil/controllers/profil_controller.dart';
import 'package:biapay_app/app/modules/signin/controllers/signin_controller.dart';
import 'package:biapay_app/app/modules/tontine/views/tontine_view.dart';
import 'package:biapay_app/app/widgets/dashboard_tile.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as sync;
import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';

import '../../../configs/const.dart';
import '../../../widgets/common/congratulations_screen.dart';
import '../../../widgets/common/custom_generate_dialog.dart';
import '../../../widgets/common/custom_select_view.dart';

import '../../events/views/new_event.dart';
import '../../merchant_profile_info_dashboard/views/merchant_profile_dash_view.dart';
import '../../merchent_profile_edit/controllers/merchent_profile_controller.dart';
import '../chart/ornob/tickets.dart';
import '../chart/ornob_2/coupon_list_screen.dart';
import '../chart/ornob_2/electronic_ticker.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    final profcontroller = Get.put(MerchentProfileController());
    return BiaScaffold(
        drawer: Menu.demo(context),
        appBar: BiaAppBar(),
        body: getIsUser() == 'MERCHANT'
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      GetBuilder<MerchentProfileController>(
                          builder: (profcontroller) {
                        return BiaText(
                          "${LocaleKeys.welcome.tr}, ${profcontroller.merchentProfile?.merchantProfile?.merchant?.merchantName.toString() ?? "Merchant"}",
                          align: TextAlign.left,
                          textType: TextType.headLine6,
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                        );
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: GetBuilder<DashboardController>(
                                builder: (controller) {
                              return BiaDropdown<String>(
                                  outerLabel: false,
                                  margin: EdgeInsets.symmetric(vertical: 10.h),
                                  options: controller.currencyPosList.value,
                                  controller: controller.currency,
                                  hint: LocaleKeys.select_currency.tr,
                                  displayName: (v) => v,
                                  onSelected: (v) {});
                            }),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: BiaDropdown<String>(
                                outerLabel: false,
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                options: [
                                  'Period 1',
                                  'Period 2',
                                  'Period 3',
                                  'Period 4'
                                ],
                                controller: controller.period,
                                hint: LocaleKeys.select_period.tr,
                                displayName: (v) => v,
                                onSelected: (v) {}),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 100,
                        padding:
                            EdgeInsets.all(10.sp).copyWith(left: 15, right: 20),
                        decoration: BoxDecoration(
                          color: Config.colors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50.w,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    Assets.dollar,
                                    width: 30.w,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                BiaText(
                                  LocaleKeys.transactions.tr,
                                  textType: TextType.headLine5,
                                  color: Colors.white,
                                ),
                              ],
                            )),
                            BiaText(
                              controller.transactionList.value.length
                                  .toString(),
                              textType: TextType.headLine3,
                              color: Colors.white,
                              fontSize: 40.sp,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      BiaText(
                        LocaleKeys.amount_sent_per.tr,
                        textType: TextType.headLine6,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                          width: Get.width,
                          height: 650.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: SfCircularChart(
                              annotations: <CircularChartAnnotation>[
                                CircularChartAnnotation(
                                    widget: Container(
                                        child: SizedBox(
                                  height: 80.0,
                                  width: 80.0,
                                  child: PhysicalModel(
                                    child: Container(),
                                    shape: BoxShape.circle,
                                    elevation: 10,
                                    shadowColor: Colors.black,
                                    // color: const Color.fromRGBO(230, 230, 230, 1),
                                    color: Colors.white,
                                  ),
                                ))),
                                CircularChartAnnotation(
                                    widget: Container(
                                  child: Text(
                                    "Total\n Amount Sent \n" +
                                        controller.amountPerShop.length
                                            .toString() +
                                        " XAF",
                                    // 'Total \n50,000 XAF',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                    ),
                                  ),
                                ))
                              ],
                              legend: Legend(
                                toggleSeriesVisibility: true,
                                orientation: LegendItemOrientation.vertical,
                                alignment: ChartAlignment.center,
                                isVisible: true,
                                position: sync.LegendPosition.bottom,
                                overflowMode: LegendItemOverflowMode.wrap,
                                height: "${150.h}",
                                width: "${350.h}",
                              ),
                              series: <CircularSeries>[
                                // Renders doughnut chart
                                DoughnutSeries<ChartData, String>(

                                    // PieSeries<ChartData, String>(
                                    radius: "90",
                                    dataSource: controller.chartData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    pointRadiusMapper: (ChartData data, _) =>
                                        data.size,
                                    dataLabelSettings: DataLabelSettings(
                                        isVisible: true,
                                        labelPosition:
                                            ChartDataLabelPosition.inside,
                                        labelIntersectAction:
                                            LabelIntersectAction.none))
                              ])),
                      SizedBox(
                        height: 15.h,
                      ),
                      BiaText(
                        LocaleKeys.quick_links.tr,
                        textType: TextType.headLine6,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DashboardTile(
                                    title: LocaleKeys.buy_airtime.tr,
                                    image: Assets.h1,
                                    ontap: () {
                                      // Get.toNamed('/top-up');
                                      Get.to(() => const TopUpScreen());
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: DashboardTile(
                                    title: LocaleKeys.payment_request.tr,
                                    image: Assets.h2,
                                    ontap: () {
                                      // Get.to(() =>  PaymentReqPage());
                                      Get.toNamed(Routes.REQUEST_MONEY);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: DashboardTile(
                                    title: LocaleKeys.bill_payment.tr,
                                    image: Assets.h3,
                                    ontap: () {
                                      Get.to(() => BillingView());
                                      // Get.toNamed(Routes.BILLING);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DashboardTile(
                                    title: LocaleKeys.tontine.tr,
                                    image: Assets.h4,
                                    ontap: () {
                                      // Get.toNamed(Routes.TONTINE);
                                      Get.to(() => TontineView());
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: DashboardTile(
                                    title: LocaleKeys.transactions.tr,
                                    image: Assets.h5,
                                    ontap: () {
                                      Get.toNamed(Routes.TRANSACTIONN);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: DashboardTile(
                                    title: LocaleKeys.event_payment.tr,
                                    image: Assets.h6,
                                    ontap: () {
                                      Get.toNamed(Routes.EVENT_MANAGEMENT);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DashboardTile(
                                    title: LocaleKeys.tickets_claims.tr,
                                    image: Assets.h7,
                                    ontap: () {
                                      Get.to(() => const Tickets());
                                      // Get.toNamed(Routes.TICKET);
                                      // Get.toNamed(Routes.CLAIM);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: DashboardTile(
                                    title: LocaleKeys.electronic_ticket.tr,
                                    image: Assets.h8,
                                    ontap: () {
                                      Get.to(() => const ElectronicTicker());
                                      // Get.toNamed(Routes.ElectronicTicker);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: DashboardTile(
                                    title: LocaleKeys.coupons_referrals.tr,
                                    image: Assets.h9,
                                    ontap: () {
                                      Get.to(() => const CouponListScreen());
                                      // Get.toNamed(Routes.COUPONS);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      BiaText(
                        LocaleKeys.financial_planning.tr,
                        textType: TextType.headLine6,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          color: Colors.transparent,
                          height: 617,
                          width: double.infinity,
                          child: FinancialPlanning()),
                    ],
                  ),
                ),
              )
            : DashboardUserView());

    // BiaScaffold(
    // drawer: Menu.demo(context),
    // appBar: BiaAppBar(),
    // body: SingleChildScrollView(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    // GetBuilder<DashboardController>(
    //   builder: (controller) {
    //     return controller.summaryList.value.length == 0
    //         ? Container()
    //         : Padding(
    //             padding: EdgeInsets.only(top: 30.h),
    //             child: summaryGridBuilderWidget(controller),
    //           );
    //   },
    // ),
    // SizedBox(
    //   height: 20.h,
    // ),
    //
    // MerchantProfileDashView(),
    //
    // SizedBox(
    //   height: 30.h,
    // ),
    //
    //
    // GetBuilder<DashboardController>(builder: (controller) {
    //   return shopColletedAmountWidget(controller);
    // }),
    // GetBuilder<DashboardController>(builder: (controller) {
    //   return timeLineWidget(controller);
    // }),
    // SizedBox(
    //   height: 20.h,
    // ),
    // GetBuilder<DashboardController>(builder: (controller) {
    //   return posColletedAmountWidget(controller);
    // }),
    // GetBuilder<DashboardController>(builder: (controller) {
    //   return timeLinePosWidget(controller);
    // }),
    // SizedBox(
    //   height: 30.h,
    // ),
    // ShopPosPieView(),
    // SizedBox(
    //   height: 20.h,
    // ),
    // ShopPosPieMethodView(),
    // SizedBox(
    //   height: 10.h,
    // ),
    // ShopInformationView(),
    // SizedBox(
    //   height: 20.h,
    // ),
    // SubscriptionInfoView(),
    // SizedBox(
    //   height: 30.h,
    // ),
    //       ],
    //     ),
    //   ),
    // );
  }

  timeLinePosWidget(DashboardController controller) {
    return Container(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
      color: Colors.white,
      child: Column(
        children: [
          showPosLineWidget(controller),
          controller.amountPerPos == LocaleKeys.select_shop_to_view_per_cate.tr
              ? amountPosTextWidget(controller, title: controller.amountPerPos)
              : controller.dashboardMethodPosList?.length != 0 &&
                      controller.paymentCategoryMap.isNotEmpty == true
                  ? pieChartByPaymentMethodCategoryWidget(
                      controller,
                    )
                  : amountPosTextWidget(controller,
                      title: LocaleKeys.no_data_found.tr),
        ],
      ),
    );
  }

  amountPosTextWidget(DashboardController controller, {title}) {
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

  showPosLineWidget(DashboardController controller) {
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
                  controller.hitApiToGetShopPerPaymentCategory(
                      timeUrl: MERCHENT_COLLECT_TODAY_PAYMENT_CATEGORY +
                          '${controller.secShopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 2) {
                  controller.hitApiToGetShopPerPaymentCategory(
                      timeUrl: MERCHENT_COLLECT_THIS_WEEK__PAYMENT_CATEGORY +
                          '${controller.secShopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 3) {
                  controller.hitApiToGetShopPerPaymentCategory(
                      timeUrl: MERCHENT_COLLECT_SEVEN_DAYS__PAYMENT_CATEGORY +
                          '${controller.secShopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 4) {
                  controller.hitApiToGetShopPerPaymentCategory(
                      timeUrl: MERCHENT_COLLECT_THIS_MONTH__PAYMENT_CATEGORY +
                          '${controller.secShopId?.toString()}');
                } else if (controller.posTimeModelList.value[index].id == 5) {
                  controller.hitApiToGetShopPerPaymentCategory(
                      timeUrl: MERCHENT_COLLECT_LAST_MONTH__PAYMENT_CATEGORY +
                          '${controller.secShopId?.toString()}');
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

  summaryGridBuilderWidget(DashboardController controller) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            mainAxisExtent: 100,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: controller.summaryList.value.length,
        itemBuilder: (context, index) {
          return gridItemWidget(
              totalCount: controller.summaryList.value[index].totalCount,
              title: controller.summaryList.value[index].title);
        });
  }

  gridItemWidget({totalCount, title}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          headingTextWidget(title: title, isHeading: true),
          SizedBox(
            height: 10.h,
          ),
          countWidetWidget(title: totalCount),
        ],
      ),
    );
  }

  headingTextWidget({title, isHeading}) {
    return BiaText(
      title ?? "",
      color: isHeading ? Colors.black : Colors.white,
      align: TextAlign.center,
      fontSize: 22.sp,
      textType: TextType.headLine6,
      fontWeight: FontWeight.w500,
      padding: EdgeInsets.zero,
    );
  }

  countWidetWidget({title}) {
    return BiaText(
      title ?? "",
      color: AppColors.colorGreen,
      align: TextAlign.center,
      fontSize: 24.sp,
      textType: TextType.headLine6,
      fontWeight: FontWeight.w500,
      padding: EdgeInsets.zero,
    );
  }

  shopColletedAmountWidget(DashboardController controller) {
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
              title: LocaleKeys.total_amount_per_collected.tr,
              isHeading: false),
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

  headerWidget(DashboardController controller, isShop) {
    return Row(
      children: [
        Expanded(child: shopSelectionDropWidget(controller, isShop)),
        SizedBox(
          width: 20.w,
        ),
        Expanded(child: currencySelectionDropWidget(controller, isShop)),
      ],
    );
  }

  currencySelectionDropWidget(DashboardController controller, bool isShop) {
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

  showCurrencySelectionDialog(DashboardController controller, bool isShop) {
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
                        controller.filterBasedOnMethod(
                            controller.dashBoardMethodModel);
                        controller.update();
                      } else {
                        controller.selectedCurrencyPosLabel =
                            controller.currencyPosList.value[index] ?? "";
                        controller.filterBaseOnCategory(
                            controller.dashBoardCategoryModel);
                        controller.update();
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

  shopSelectionDropWidget(DashboardController controller, bool isShop) {
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

  showShopSelectionDialog(DashboardController controller, bool isShop) {
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
                            print(
                                "check shop id $isShop, and ${controller.secShopId}");
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
                            }
                            print(
                                "check shop id $isShop, and ${controller.secShopId}");

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

  timeLineWidget(DashboardController controller) {
    return Container(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
      color: Colors.white,
      child: Column(
        children: [
          showTimeLineWidget(controller, true),
          controller.amountPerShop == LocaleKeys.select_shop_to_view_per.tr
              ? amountTextWidget(controller, title: controller.amountPerShop)
              : controller.dashboardMethodList?.length != 0 &&
                      controller.paymentMethodMap.isNotEmpty == true
                  ? pieChartByPaymentMethodWidget(
                      controller,
                    )
                  : amountTextWidget(controller,
                      title: LocaleKeys.no_data_found.tr),
        ],
      ),
    );
  }

  amountTextWidget(DashboardController controller, {title}) {
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

  showTimeLineWidget(DashboardController controller, bool isShop) {
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
                  controller.hitApiToGetShopPerPaymentMethod(
                      timeUrl: MERCHENT_COLLECT_TODAY_PAYMENT_METHOD +
                          '${controller.shopId?.toString()}');
                } else if (controller.timeModelList.value[index].id == 2) {
                  controller.hitApiToGetShopPerPaymentMethod(
                      timeUrl: MERCHENT_COLLECT_THIS_WEEK__PAYMENT_METHOD +
                          '${controller.shopId?.toString()}');
                } else if (controller.timeModelList.value[index].id == 3) {
                  controller.hitApiToGetShopPerPaymentMethod(
                      timeUrl: MERCHENT_COLLECT_SEVEN_DAYS__PAYMENT_METHOD +
                          '${controller.shopId?.toString()}');
                } else if (controller.timeModelList.value[index].id == 4) {
                  controller.hitApiToGetShopPerPaymentMethod(
                      timeUrl: MERCHENT_COLLECT_THIS_MONTH__PAYMENT_METHOD +
                          '${controller.shopId?.toString()}');
                } else if (controller.timeModelList.value[index].id == 5) {
                  controller.hitApiToGetShopPerPaymentMethod(
                      timeUrl: MERCHENT_COLLECT_LAST_MONTH__PAYMENT_METHOD +
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

  pieChartByPaymentMethodWidget(DashboardController controller) {
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
        // legendPosition: LegendPosition.right,
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

  pieChartByPaymentMethodCategoryWidget(DashboardController controller) {
    return PieChart(
      dataMap: controller.paymentCategoryMap ?? {},
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(Get.context!).size.width / 3.2,
      colorList: controller.catefgoryColorList,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      ringStrokeWidth: 32,
      //centerText: "HYBRID",
      // legendOptions: LegendOptions(
      //   showLegendsInRow: false,
      //   legendPosition: LegendPosition.right,
      //   showLegends: true,
      //   legendShape: BoxShape.circle,
      //   legendTextStyle: TextStyle(
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
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

  posColletedAmountWidget(DashboardController controller) {
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
              title: LocaleKeys.total_amount_collected_category.tr,
              isHeading: false),
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
}

class FinancialPlanning extends StatefulWidget {
  @override
  _FinancialPlanningState createState() => _FinancialPlanningState();
}

class _FinancialPlanningState extends State<FinancialPlanning> {
  final List<String> names = <String>[
    'January 2021',
    'February 2021',
    'March 2021',
    'April 2021',
    'May 2021',
    'June 2021',
    'July 2021',
    'August 2021',
    'September 2021',
    'October 2021',
    'November 2021',
    'December 2021',
  ];

  int? tappedIndex;
  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Column(
      children: [
        Container(
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: names.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tappedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 3),
                    decoration: BoxDecoration(
                        color: tappedIndex == index
                            ? Colors.lightGreen[500]
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(8))),
                    alignment: Alignment.center,
                    // height: 25,
                    width: 110,

                    child: Text(
                      '${names[index]}',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),
        ),
        Container(
          width: Get.width,
          height: 800.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
          child: SfCircularChart(
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: SizedBox(
                  height: 50.0.h,
                  width: 50.0.w,
                  child: const PhysicalModel(
                    // child: Container(),
                    shape: BoxShape.circle,
                    elevation: 10,
                    color: Color.fromRGBO(230, 230, 230, 1),
                  ),
                ),
              ),
              CircularChartAnnotation(
                widget: Container(
                  // elevation: 10,
                  // shadowColor: Colors.black,

                  child: Text(
                    'Total \n50,000 XAF',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                  ),
                ),
              )
            ],
            legend: Legend(
              orientation: LegendItemOrientation.vertical,
              alignment: ChartAlignment.center,
              isVisible: true,
              position: sync.LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
              height: "${345.h}",
              width: "${400.w}",
            ),
            series: <CircularSeries>[
              // Renders doughnut chart

              DoughnutSeries<ChartData, String>(
                dataSource: tappedIndex == 0
                    ? controller.financialPlaningChartData
                    : tappedIndex == 1
                        ? controller.fin
                        : controller.finn,
                // dataSource: controller.financialPlaningChartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelSettings: const DataLabelSettings(isVisible: false),
                // pointRadiusMapper: (ChartData data, _) => data.size
              )
            ],
          ),
        ),
      ],
    );
  }
}
