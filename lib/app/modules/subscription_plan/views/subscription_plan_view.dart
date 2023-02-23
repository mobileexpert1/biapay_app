import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/subscription_plan_component.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/subscription_plan_controller.dart';

class SubscriptionPlanView extends GetView<SubscriptionPlanController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.subscription_plan.tr),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              for (var i = 0; i < 5; i++)
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: SubscriptionPlanComponent()),
            ],
          ),
        ));
  }
}
