// import 'package:biapay_app/presentation/common/widgets/common/bia_dropdown.dart';
// import 'package:biapay_app/presentation/app/home/chart/ornob_2/coupon_widget.dart';
// import 'package:biapay_app/presentation/app/home/chart/ornob_2/refer_a_friend.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/common/bia_appbar.dart';
import '../../../../widgets/common/bia_scaffold.dart';
import 'coupon_widget.dart';

class CouponListScreen extends StatefulWidget {
  const CouponListScreen({Key? key}) : super(key: key);

  @override
  _CouponListScreenState createState() => _CouponListScreenState();
}

class _CouponListScreenState extends State<CouponListScreen> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple('Coupons'),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) =>  CouponWidget(),
      ),
    );
  }
}
