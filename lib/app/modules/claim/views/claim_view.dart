import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/claim_controller.dart';

class ClaimView extends GetView<ClaimController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClaimView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ClaimView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
