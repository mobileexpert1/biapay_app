import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coupon_controller.dart';

class CouponView extends GetView<CouponController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CouponView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CouponView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
