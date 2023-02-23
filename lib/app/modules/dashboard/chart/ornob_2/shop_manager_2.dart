import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_dropdown.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopManager2 extends StatelessWidget {
  const ShopManager2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> shop = ['Shop 1', 'Shop 2', 'Shop 3'];
    final List<String> pos = ['Pos 1', 'Pos 2', 'Pos 3'];
    return BiaScaffold(
      appBar: BiaAppBar.simple('Shop managers'),
      body: Column(
        children: [
          BiaDropdown<String>(
              options: shop,
              margin: EdgeInsets.only(left: 20.h, right: 20.h),
              controller: TextEditingController(),
              hint: '',
              displayName: (v) => v,
              onSelected: (item) {}),
          BiaDropdown<String>(
              options: pos,
              margin: EdgeInsets.only(left: 20.h, right: 20.h),
              controller: TextEditingController(),
              hint: '',
              displayName: (v) => v,
              onSelected: (item) {}),
          Container(
            margin: EdgeInsets.only(left: 20.h, right: 20.h),
            width: double.infinity,
            height: 80.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BiaText(
                  'Shop managers',
                  fontSize: 28.h,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                TextButton(
                    onPressed: () {},
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
                    )),
              ],
            ),
          ),
          BiaTextField(
            padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.h),
            controller: TextEditingController(),
            hint: "Search in records",
            suffixIcon: const Icon(Icons.search),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 15, left: 20.h, right: 20.h),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  )),
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BiaText(
                        'John Doe',
                        fontSize: 20.h,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: const [
                          BiaText(
                            'Email:- ',
                            fontWeight: FontWeight.bold,
                          ),
                          BiaText(
                            'adminbiapay@gmai.com',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: const [
                          BiaText(
                            'Shop:- ',
                            fontWeight: FontWeight.bold,
                          ),
                          BiaText(
                            'WIIK ev',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: const [
                          BiaText(
                            'Point of sales:- ',
                            fontWeight: FontWeight.bold,
                          ),
                          BiaText(
                            'Lorem Ispum',
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.more_horiz_rounded),
                ],
              )),
          Container(
              margin: EdgeInsets.only(bottom: 15, left: 20.h, right: 20.h),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  )),
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BiaText(
                        'John Doe',
                        fontSize: 20.h,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: const [
                          BiaText(
                            'Email:- ',
                            fontWeight: FontWeight.bold,
                          ),
                          BiaText(
                            'adminbiapay@gmai.com',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: const [
                          BiaText(
                            'Shop:- ',
                            fontWeight: FontWeight.bold,
                          ),
                          BiaText(
                            'WIIK ev',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: const [
                          BiaText(
                            'Point of sales:- ',
                            fontWeight: FontWeight.bold,
                          ),
                          BiaText(
                            'Lorem Ispum',
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.more_horiz_rounded),
                ],
              )),
        ],
      ),
    );
  }
}
