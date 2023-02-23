import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/widgets/common/bia_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiaScaffold extends StatelessWidget {
  final Widget body;
  final bool hasSidePadding;
  final Widget? drawer;
  final Widget? bottomNav;
  final PreferredSizeWidget? appBar;
  final bool ?   resizeToAvoidBottomInset;


  const BiaScaffold({
    required this.body,
    this.appBar,
    this.bottomNav,
    this.drawer,
    this.resizeToAvoidBottomInset,
    this.hasSidePadding = true,
  });

  /*Menu.demo(context)*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset:resizeToAvoidBottomInset?? true,
      bottomNavigationBar: bottomNav,
      drawer: drawer,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: hasSidePadding
            ? EdgeInsets.symmetric(horizontal: 20.w)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.background),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(child: body),
      ),
    );
  }
}


// class Assets {
//   static const String paymentReq = 'assets/images/payment-req.png';
//   static const String ticketClaims = 'assets/images/ticket-claims.png';
//   static const String invoiceManagement =
//       'assets/images/invoice-management.png';
//   static const String guide = 'assets/images/guide.png';
//   static const String transaction = 'assets/images/transaction.png';
//   static const String sideImpressum = 'assets/images/Side-Impressum.png';
//   static const String sideAppversion = 'assets/images/side-appversion.png';
//   static const String businessAcc = 'assets/images/business-acc.png';
//   static const String users = 'assets/images/users.png';
//   static const String arrowDown = 'assets/images/arrowDown.png';
//   static const String home = 'assets/images/home.png';
//   static const String scanPay = 'assets/images/scan-pay.png';
//   static const String logo = 'assets/images/logo_biapay.png';
//   static const String sideContact = 'assets/images/side-contact.png';
//   static const String transactions = 'assets/images/transactions.png';
//   static const String paymentRequest = 'assets/images/payment-request.png';
//   static const String buyAirtime = 'assets/images/buy-airtime.png';
//   static const String couponReferral = 'assets/images/coupon-referral.png';
//   static const String electronicTicket = 'assets/images/electronic-ticket.png';
//   static const String customer = 'assets/images/customer.png';
//   static const String congratulation = 'assets/images/congratulation.png';
//   static const String tontine = 'assets/images/tontine.png';
//   static const String passwordEye = 'assets/images/password-eye.png';
//   static const String privateaAcc = 'assets/images/privatea-acc.png';
//   static const String private = 'assets/images/private.png';
//   static const String business = 'assets/images/business.png';
//   static const String menu = 'assets/images/Menu.png';
//   static const String dollar = 'assets/images/dollar.png';
//   static const String rewardsPermotions =
//       'assets/images/rewards&permotions.png';
//   static const String eventManagment = 'assets/images/event-managment.png';
//   static const String guide2 = 'assets/images/guide2.png';
//   static const String billPayment = 'assets/images/bill-payment.png';
//   static const String eventPayment = 'assets/images/event-payment.png';
//   static const String transaction2 = 'assets/images/transaction2.png';
//   static const String sideSetting = 'assets/images/side-setting.png';
//   static const String analytics = 'assets/images/analytics.png';
//   static const String tickets = 'assets/images/tickets.png';
//   static const String register = 'assets/images/Register.png';
//   static const String warning = 'assets/images/warning.png';
//   static const String landingLogo = 'assets/images/LandingLogo.png';
//   static const String subscriptionPlan = 'assets/images/subscription-plan.png';
//   static const String pointOfSales = 'assets/images/point-of-sales.png';
//   static const String background = 'assets/images/background.jpg';
//   static const String shops = 'assets/images/Shops.png';
//   static const String sidePolicies = 'assets/images/side-policies.png';
//   static const String contact = 'assets/images/contact.png';
//   static const String b1 = 'assets/icons/b1.svg';
//   static const String b2 = 'assets/icons/b2.svg';
//   static const String b3 = 'assets/icons/b3.svg';
//   static const String b4 = 'assets/icons/b4.svg';
//   static const String b5 = 'assets/icons/b5.svg';
//   static const String h1 = 'assets/icons/h1.svg';
//   static const String h2 = 'assets/icons/h2.svg';
//   static const String h3 = 'assets/icons/h3.svg';
//   static const String h4 = 'assets/icons/h4.svg';
//   static const String h5 = 'assets/icons/h5.svg';
//   static const String h6 = 'assets/icons/h6.svg';
//   static const String h7 = 'assets/icons/h7.svg';
//   static const String h8 = 'assets/icons/h8.svg';
//   static const String h9 = 'assets/icons/h9.svg';
//   static const String finger = 'assets/images/finger.svg';
//   static const String face = 'assets/images/face.svg';
//   static const String p1 = 'assets/images/p1.svg';
//   static const String p2 = 'assets/images/p2.svg';
//   static const String p3 = 'assets/images/p3.svg';
//   static const String p4 = 'assets/images/p4.svg';
//   static const String p5 = 'assets/images/p5.svg';
//   static const String a1 = 'assets/icons/wallet1.png';
//   static const String a2 = 'assets/icons/bank.png';
//   static const String a3 = 'assets/icons/cc.png';
//   static const String a4 = 'assets/icons/wallet.png';
// }
