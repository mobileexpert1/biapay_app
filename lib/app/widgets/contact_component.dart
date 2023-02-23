import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:flutter/material.dart';

class ContactComponent extends StatelessWidget {
  const ContactComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
        padding: EdgeInsets.all(
          10.w,
        ),
        // height: 120.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                alignment: Alignment.center,
                height: 70.h,
                width: 70.h,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
                child: BiaText(
                  'J',
                  fontSize: 40.h,
                ),
              ),
              // SizedBox(width: 20.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BiaText(
                    'John Doe',
                    fontSize: 24.h,
                    // padding: const EdgeInsets.only(top: 25),
                    fontWeight: FontWeight.w500,
                  ),
                  BiaText(
                    'IFCS45673336',
                    fontSize: 20.h,
                    color: Colors.grey,
                    // padding: const EdgeInsets.only(left: 15),
                  ),
                ],
              )
            ]),
            const Icon(
              Icons.more_vert_outlined,
            )
          ],
        ));
  }
}
