import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/contact_component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transfert_controller.dart';

class TransfertView extends GetView<TransfertController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
       appBar: BiaAppBar.simple('Payment request'.tr),
      body: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.h)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.redo,
                      size: 30.h,
                    ),
                    BiaText(
                      '  Share your link to get paid',
                      fontSize: 20.h,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
                const Icon(
                  Icons.navigate_next,
                ),
              ],
            ),
          ),
          BiaTextField(
            controller: TextEditingController(text: 'Enter wallet id'),
            hint: 'Wallet ID',
          ),
          SizedBox(height: 10.h),
          Align(
              alignment: Alignment.centerLeft,
              child: BiaText(
                'Your contact',
                fontSize: 26.h,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 15),
              )),
          Container(
            margin: EdgeInsets.only(right: 20.h, left: 20.h, top: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.h)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search_outlined,
                  size: 30.h,
                  color: Colors.grey,
                ),
                BiaText(
                  '  Search by name',
                  fontSize: 20.h,
                  color: Colors.grey,
                )
                // Container(
                //   child: Row(
                //     children: [
                //       Icon(Icons.redo,size: 30.h,),
                //       BiaText('  Share your link to get paid',fontSize: 20.h,fontWeight: FontWeight.w600,)
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          ContactComponent(),
        ],
      ),
    );
  }
}
