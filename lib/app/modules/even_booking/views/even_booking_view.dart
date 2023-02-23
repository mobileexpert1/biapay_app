import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/even_booking_controller.dart';

class EvenBookingView extends GetView<EvenBookingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EvenBookingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EvenBookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
