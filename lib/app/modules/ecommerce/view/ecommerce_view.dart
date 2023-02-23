import 'package:biapay_app/app/modules/ecommerce/controller/ecommerce_controller.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EcommerceView extends GetView<EcommerceController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.ecommerce.tr, isShowFilter: false),
        body: GridView.count(
          padding: EdgeInsets.only(top: 5),
          crossAxisCount: 2,
          children: List.generate(10, (index) {
            return _buildCard(index, context);
          }),
        ),
    );
  }

  Widget _buildCard(int index, BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("cell selected -*-> " + index.toString());
        Get.toNamed(Routes.ECOMMERCEDETAIL);
      },
      child: Card(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // SizedBox(height: 3,),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Image.asset(
                  "assets/images/dummy.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: BiaText("Title", fontSize: 14, fontWeight: FontWeight.w600,)),
                        Container(
                            width: 30,
                            child: Center(child: BiaText("20", fontSize: 14, fontWeight: FontWeight.w600,))),
                      ],
                    ),
                    Container(
                        height: 35,
                        child: BiaText("description", fontSize: 12, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}