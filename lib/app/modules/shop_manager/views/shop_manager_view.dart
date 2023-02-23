import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/shop_component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shop_manager_controller.dart';

class ShopManagerView extends GetView<ShopManagerController> {
  @override
  Widget build(BuildContext context) {
    final List<String> shop = ['Shop 1', 'Shop 2', 'Shop 3'];
    return BiaScaffold(
      appBar: BiaAppBar.simple('Shop managers'),
      hasSidePadding: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            BiaDropdown<String>(
              options: shop,
              controller: TextEditingController(),
              hint: '',
              displayName: (v) => v,
              onSelected: (item) {},
              margin: EdgeInsets.zero,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BiaText(
                  'Shop managers',
                  fontSize: 28.h,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 35.h,
                          ),
                          BiaText(
                            'Add new',
                            fontSize: 20.h,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            BiaTextField(
              padding: EdgeInsets.zero,
              controller: TextEditingController(),
              hint: "Search in records",
              suffixIcon: Icon(
                Icons.search,
                // color: Config.colors.blueColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ShopComponent(),
            // ShopTable()
          ],
        ),
      ),
    );
  }
}
