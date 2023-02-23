import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:flutter/material.dart';

class ShopComponent extends StatelessWidget {
  const ShopComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
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
                ],
              ),
            ),
            IconButton(
                constraints: BoxConstraints(
                  minHeight: 20,
                  minWidth: 20,
                ),
                onPressed: () {
                  // Get.dialog();
                },
                icon: Icon(Icons.more_horiz_rounded)),
          ],
        ));
  }
}
