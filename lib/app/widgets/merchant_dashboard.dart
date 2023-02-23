// import 'dart:convert';
// import 'package:biapay_app/domain/i_auth_provider.dart';
// import 'package:biapay_app/domain/i_info_provider.dart';
// import 'package:biapay_app/domain/merchant/subscription/i_subscription_provider.dart';
// import 'package:biapay_app/infustructure/app/merchant/subscription_provider.dart';
// import 'package:biapay_app/presentation/app/home/chart/ornob/tickets.dart';
// import 'package:biapay_app/presentation/app/home/chart/ornob_2/add_new_customer.dart';
// import 'package:biapay_app/presentation/app/home/chart/ornob_2/pricing_list.dart';
// import 'package:biapay_app/presentation/app/home/chart/ornob_2/shop_pos_1.dart';
// import 'package:biapay_app/presentation/app/widget/custom_date_range_picker.dart';
// import 'package:biapay_app/presentation/merchant/pos_screen.dart';
// import 'package:biapay_app/resources/assets.dart';
// import 'package:biapay_app/service/home/chart/merchant_dashboard_controller.dart';
// import 'package:biapay_app/service/profile/profile_controller.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../home/chart/ornob_2/event_booking_history.dart';
// import '../home/chart/ornob_2/invoice_management.dart';

// class MerchantDashboard extends HookWidget {
//   final IInfoProvider infoProvider = Get.find<IInfoProvider>();
//   final ISubscriptionProvider subscriptionProvider =
//       Get.put<ISubscriptionProvider>(SubscriptionProvider());

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController currency = useTextEditingController();
//     final TextEditingController period = useTextEditingController();

//     return GetBuilder<MerchantDashboardController>(
//       init: MerchantDashboardController(infoProvider: infoProvider),
//       builder: (controller) {
//         return BiaScaffold(
//           appBar: const BiaAppBar(),
//           body: ListView(
//             children: [
//               GetBuilder<ProfileController>(
//                   init: ProfileController(
//                       authProvider: Get.find<IAuthProvider>(),
//                       context: context),
//                   builder: (controller) {
//                     return BiaText(
//                       'Welcome, ${controller.merchantInfo!.profileInfo.merchantName}!',
//                       textType: TextType.headLine5,
//                       color: Colors.white,
//                       padding: EdgeInsets.symmetric(vertical: 10.h),
//                     );
//                   }),
//               // SummaryGrid(
//               //   summary: controller.summary.summary,
//               // ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     width: 150.w,
//                     child: BiaDropdown<String>(
//                         margin: EdgeInsets.symmetric(vertical: 10.h),
//                         options: const ['USD', 'EURO', 'XAF', 'OUV', 'ALL'],
//                         controller: currency,
//                         hint: 'Select currency',
//                         displayName: (v) => v,
//                         onSelected: (v) {}),
//                   ),
//                   SizedBox(
//                     width: 250.w,
//                     child: InkWell(
//                       onTap: () {
//                         showDialog(
//                             context: context,
//                             builder: (context) => CustomDateRangePicker(
//                                     onDateChanged: (dateTimeRange) {
//                                   controller.setDateRange(
//                                       dateTimeRange: dateTimeRange);

//                                   period.text = controller.dateText;
//                                 }));
//                       },
//                       child: BiaTextField(
//                         controller: period,
//                         hint: 'Select Period',
//                         textType: TextType.headLine6,
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         enabled: false,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10.h),
//                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//                 decoration: BoxDecoration(
//                     color: Colors.blue[900],
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           Assets.transaction,
//                           width: 60.w,
//                         ),
//                         const BiaText(
//                           'Transactions',
//                           textType: TextType.headLine5,
//                           color: Colors.white,
//                         )
//                       ],
//                     ),
//                     const BiaText(
//                       '25',
//                       textType: TextType.headLine4,
//                       color: Colors.white,
//                     )
//                   ],
//                 ),
//               ),
//               BiaText(
//                 'Amount sent - percentage',
//                 textType: TextType.headLine5,
//                 color: Colors.white,
//                 padding: EdgeInsets.symmetric(vertical: 10.h),
//               ),
//               Container(
//                 width: 300.w,
//                 height: 250.h,
//                 padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Echarts(
//                     option: jsonEncode({
//                   "tooltip": {"trigger": "item"},
//                   "legend": {"orient": "vertical", "left": "left"},
//                   "series": [
//                     {
//                       "name": "Amount sent",
//                       "type": "pie",
//                       "radius": "90%",
//                       "avoidLabelOverlap": false,
//                       "label": {
//                         "show": true,
//                         "position": "inner",
//                         "color": "#fff",
//                         "fontWeight": "bold",
//                         "formatter": "{b}\n{d}%"
//                       },
//                       "emphasis": {
//                         "itemStyle": {
//                           "shadowBlur": 10,
//                           "shadowOffsetX": 0,
//                           "shadowColor": "rgba(0, 0, 0, 0.5)"
//                         }
//                       },
//                       "labelLine": {"show": true},
//                       "data": [
//                         {"value": 1048, "name": "Eu"},
//                         {"value": 735, "name": "Orang Money"},
//                         {"value": 580, "name": "MTN"},
//                         {"value": 484, "name": "Visa"},
//                       ]
//                     }
//                   ]
//                 })),
//               ),
//               // BiaText(
//               //   'Amount sent - percentage',
//               //   textType: TextType.headLine5,
//               //   color: Colors.white,
//               //   padding: EdgeInsets.symmetric(vertical: 10.h),
//               // ),
//               // Container(
//               //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
//               //   decoration: BoxDecoration(
//               //       color: Colors.white,
//               //       borderRadius: BorderRadius.circular(20)),
//               //   child: CustomChart(
//               //     chartData: controller.chart,
//               //   ),
//               // ),

//               BiaText(
//                 'Demo Pages',
//                 textType: TextType.headLine5,
//                 color: Colors.white,
//                 padding: EdgeInsets.symmetric(vertical: 10.h),
//               ),
//               // Container(
//               //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
//               //   decoration: BoxDecoration(
//               //       color: Colors.white,
//               //       borderRadius: BorderRadius.circular(20)),
//               //   child: Column(
//               //     children: [
//               //       Row(
//               //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //         children: [
//               //           DashboardTile(
//               //             title: 'Buy airtime',
//               //             image: Assets.buyAirtime,
//               //             ontap: () {
//               //               // Get.toNamed('/top-up');
//               //             },
//               //           ),
//               //           DashboardTile(
//               //             title: 'Payment request',
//               //             image: Assets.paymentRequest,
//               //             ontap: () {
//               //               // Get.to(() => const ShopScreen());
//               //             },
//               //           ),
//               //           DashboardTile(
//               //             title: 'Bill payment',
//               //             image: Assets.billPayment,
//               //             ontap: () {
//               //               // Get.toNamed('/transacion');
//               //               Get.to(() => const PosScreen());
//               //             },
//               //           ),
//               //         ],
//               //       ),
//               //       SizedBox(
//               //         height: 20.w,
//               //       ),
//               //       Row(
//               //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //         children: [
//               //           DashboardTile(
//               //             title: 'Tontine',
//               //             image: Assets.tontine,
//               //             ontap: () {
//               //               Get.toNamed('/top-up');
//               //             },
//               //           ),
//               //           DashboardTile(
//               //             title: 'Transaction',
//               //             image: Assets.transaction2,
//               //             ontap: () {
//               //               Get.to(() => const ShopScreen());
//               //             },
//               //           ),
//               //           DashboardTile(
//               //             title: 'Event payment',
//               //             image: Assets.eventPayment1,
//               //             ontap: () {
//               //               // Get.toNamed('/transacion');
//               //               Get.to(() => const PosScreen());
//               //             },
//               //           ),
//               //         ],
//               //       ),
//               //       SizedBox(
//               //         height: 20.w,
//               //       ),
//               //       Row(
//               //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //         children: [
//               //           DashboardTile(
//               //             title: 'Tickets/Claims',
//               //             image: Assets.ticketClaims,
//               //             ontap: () {
//               //               Get.to(() => const SubsCriptionScreen());
//               //             },
//               //           ),
//               //           DashboardTile(
//               //             title: 'Electronic Ticket',
//               //             image: Assets.electronicTicket,
//               //             ontap: () {
//               //               Get.to(() => const ProductScreen());
//               //             },
//               //           ),
//               //           // DashboardTile(
//               //           //   title: 'Customer'.tr,
//               //           //   image: Assets.transaction2,
//               //           //   ontap: () {
//               //           //     Get.to(() => const CustomerScreen());
//               //           //   },
//               //           // ),
//               //           DashboardTile(
//               //             title: 'Coupons & Refarral',
//               //             image: Assets.couponReferral,
//               //             ontap: () {
//               //               Get.to(() => const CouponScreen());
//               //             },
//               //           )
//               //         ],
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Column(
//                   children: [
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     //   children: [
//                     //     DashboardTile(
//                     //       title: 'Buy airtime',
//                     //       image: Assets.buyAirtime,
//                     //       ontap: () {
//                     //         // Get.toNamed('/top-up');
//                     //       },
//                     //     ),
//                     //     DashboardTile(
//                     //       title: 'Payment request',
//                     //       image: Assets.paymentRequest,
//                     //       ontap: () {
//                     //         // Get.to(() => const ShopScreen());
//                     //       },
//                     //     ),
//                     //     DashboardTile(
//                     //       title: 'Bill payment',
//                     //       image: Assets.billPayment,
//                     //       ontap: () {
//                     //         // Get.toNamed('/transacion');
//                     //         Get.to(() => const PosScreen());
//                     //       },
//                     //     ),
//                     //   ],
//                     // ),
//                     // SizedBox(
//                     //   height: 20.w,
//                     // ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     //   children: [
//                     //     DashboardTile(
//                     //       title: 'Tontine',
//                     //       image: Assets.tontine,
//                     //       ontap: () {
//                     //         Get.toNamed('/top-up');
//                     //       },
//                     //     ),
//                     //     DashboardTile(
//                     //       title: 'Transaction',
//                     //       image: Assets.transaction2,
//                     //       ontap: () {
//                     //         Get.to(() => const ShopScreen());
//                     //       },
//                     //     ),
//                     //     DashboardTile(
//                     //       title: 'Event payment',
//                     //       image: Assets.eventPayment1,
//                     //       ontap: () {
//                     //         // Get.toNamed('/transacion');
//                     //         Get.to(() => const PosScreen());
//                     //       },
//                     //     ),
//                     //   ],
//                     // ),
//                     // SizedBox(
//                     //   height: 20.w,
//                     // ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     //   children: [
//                     //     DashboardTile(
//                     //       title: 'Tickets/Claims',
//                     //       image: Assets.ticketClaims,
//                     //       ontap: () {
//                     //         Get.to(() => const SubsCriptionScreen());
//                     //       },
//                     //     ),
//                     //     DashboardTile(
//                     //       title: 'Electronic Ticket',
//                     //       image: Assets.electronicTicket,
//                     //       ontap: () {
//                     //         Get.to(() => const ProductScreen());
//                     //       },
//                     //     ),
//                     //     // DashboardTile(
//                     //     //   title: 'Customer'.tr,
//                     //     //   image: Assets.transaction2,
//                     //     //   ontap: () {
//                     //     //     Get.to(() => const CustomerScreen());
//                     //     //   },
//                     //     // ),
//                     //     DashboardTile(
//                     //       title: 'Coupons & Refarral',
//                     //       image: Assets.couponReferral,
//                     //       ontap: () {
//                     //         Get.to(() => const CouponScreen());
//                     //       },
//                     //     )
//                     //   ],
//                     // ),
//                     SizedBox(
//                       height: 20.w,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         DashboardTile(
//                           title: 'Shops',
//                           image: Assets.shops,
//                           ontap: () {
//                             Get.to(() => const ShopPos1());
//                           },
//                         ),
//                         DashboardTile(
//                           title: 'Point of sales',
//                           image: Assets.pointOfSales,
//                           ontap: () {
//                             Get.to(() => const PosScreen());
//                           },
//                         ),
//                         DashboardTile(
//                           title: 'Subscription plan',
//                           image: Assets.subscriptionPlan,
//                           ontap: () {
//                             Get.to(() => const PricingList());
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20.w,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         DashboardTile(
//                           title: 'Customers',
//                           image: Assets.customer,
//                           ontap: () {
//                             Get.to(() => const AddNewCustomer());
//                           },
//                         ),
//                         DashboardTile(
//                           title: 'Tickets',
//                           image: Assets.tickets,
//                           ontap: () {
//                             Get.to(() => const Tickets());
//                           },
//                         ),
//                         DashboardTile(
//                           title: 'Users',
//                           image: Assets.users,
//                           ontap: () {
//                             // Get.to(() => Null);
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20.w,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         DashboardTile(
//                           title: 'Event\n management',
//                           image: Assets.eventManagment2,
//                           ontap: () {
//                             Get.to(() => const EventBookingHistory());
//                           },
//                         ),
//                         DashboardTile(
//                           title: 'Rewards\n & Promotions',
//                           image: Assets.rewardsPermotions,
//                           ontap: () {
//                             // Get.to(() => Null);
//                           },
//                         ),
//                         DashboardTile(
//                           title: 'Invoice\n management',
//                           image: Assets.invoiceManagement,
//                           ontap: () {
//                             Get.to(() => const InvoiceManagement());
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(
//                 height: 20.h,
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
