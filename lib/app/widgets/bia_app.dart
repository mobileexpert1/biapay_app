import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiaApp extends StatelessWidget {
  final List<GetPage> route;
  const BiaApp({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(490.9, 1036.4),
        builder: (context,child) {
          return Container(
            child: null,
          );
        });
  }
}
