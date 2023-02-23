// import 'package:biapay_app/app/models/dashboard_pie_chart.dart';
// import 'package:biapay_app/app/models/merchant_summary_model.dart';
// import 'package:biapay_app/app/modules/dashboard/chart/top_up/top_up_screen.dart';
// import 'package:biapay_app/app/modules/dashboard/views/dashboard_user_view.dart';
// import 'package:biapay_app/app/modules/dashboard/views/pos_shop_pie_chart_method_view.dart';
// import 'package:biapay_app/app/modules/dashboard/views/pos_shop_pie_chart_view.dart';
// import 'package:biapay_app/app/modules/dashboard/views/shop_information_view.dart';
// import 'package:biapay_app/app/modules/pricing/sub_menu_billing/view/billing_view.dart';
// import 'package:biapay_app/app/modules/profil/controllers/profil_controller.dart';
// import 'package:biapay_app/app/modules/signin/controllers/signin_controller.dart';
// import 'package:biapay_app/app/modules/tontine/views/tontine_view.dart';
// import 'package:biapay_app/app/widgets/dashboard_tile.dart';
// import 'package:biapay_app/app/widgets/export_file.dart';
// import 'package:pie_chart/pie_chart.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart' as sync;
// import 'package:biapay_app/app/configs/configs.dart';
// import 'package:biapay_app/app/widgets/common/bia_text.dart';
//
// import '../../../configs/const.dart';
// import '../../../widgets/common/congratulations_screen.dart';
// import '../../../widgets/common/custom_generate_dialog.dart';
// import '../../../widgets/common/custom_select_view.dart';
//
// import '../../events/views/new_event.dart';
// import '../chart/ornob/tickets.dart';
// import '../chart/ornob_2/coupon_list_screen.dart';
// import '../chart/ornob_2/electronic_ticker.dart';
// import '../controllers/dashboard_controller.dart';
// class demo extends StatefulWidget {
//   @override
//   _demoState createState() => _demoState();
// }
//
// class _demoState extends State<demo> {
//   @override
//   Widget build(BuildContext context) {
//     return
//     BiaScaffold(
//     drawer: Menu.demo(context),
//     appBar: BiaAppBar(),
//     body: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//     GetBuilder<DashboardController>(
//       builder: (controller) {
//         return controller.summaryList.value.length == 0
//             ? Container()
//             : Padding(
//                 padding: EdgeInsets.only(top: 30.h),
//                 child: summaryGridBuilderWidget(controller),
//               );
//       },
//     ),
//     SizedBox(
//       height: 20.h,
//     ),
//
//     MerchantProfileDashView(),
//
//     SizedBox(
//       height: 30.h,
//     ),
//
//
//     GetBuilder<DashboardController>(builder: (controller) {
//       return shopColletedAmountWidget(controller);
//     }),
//     GetBuilder<DashboardController>(builder: (controller) {
//       return timeLineWidget(controller);
//     }),
//     SizedBox(
//       height: 20.h,
//     ),
//     GetBuilder<DashboardController>(builder: (controller) {
//       return posColletedAmountWidget(controller);
//     }),
//     GetBuilder<DashboardController>(builder: (controller) {
//       return timeLinePosWidget(controller);
//     }),
//     SizedBox(
//       height: 30.h,
//     ),
//     ShopPosPieView(),
//     SizedBox(
//       height: 20.h,
//     ),
//     ShopPosPieMethodView(),
//     SizedBox(
//       height: 10.h,
//     ),
//     ShopInformationView(),
//     SizedBox(
//       height: 20.h,
//     ),
//     SubscriptionInfoView(),
//     SizedBox(
//       height: 30.h,
//     ),
//           ],
//         ),
//       ),
//     );
//   }
// }
