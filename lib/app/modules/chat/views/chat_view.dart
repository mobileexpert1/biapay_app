import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    const String loremIpsum =
        '''Lorem ipsum dolor sit amet, conse ctetur adipis cing elit. Fusce luctus nisl pretium nisi iaculis convallis. Suspe ndisse finibus risus ultricies ornare placerat. Donec nec nibh id felis aliquam pharetra id vitae eros. Vivamus ac ex et massa laoreet fringilla. Morbi sollicitudin lectus non rhoncus commodo. Donec leo risus, facilisis eu vestibulum vitae, condimentum sed quam. In lacus tortor, consectetur a risus ut, ma''';
    const String imagex =
        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";

    return BiaScaffold(
        appBar: BiaAppBar.simple('My messages'),
        body: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            BiaText(
              LocaleKeys.all_message.tr,
              color: Colors.white,
              fontSize: 30.sp,
            ),
            SizedBox(
              height: 12.h,
            ),

            Container(
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return BiaNotificationTile(
                    image: imagex,
                    title: 'John Doe',
                    details: loremIpsum,
                    count: index % 2 == 0 ? 5 : 0,
                  );
                },
              ),
            ),
            // Container(
            //   // margin: EdgeInsets.symmetric(vertical: 10.h),
            //   clipBehavior: Clip.hardEdge,
            //   padding: EdgeInsets.symmetric(vertical: 10.h),
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //   ),
            //   child: Column(
            //     children: const [
            //       BiaNotificationTile(
            //           image: imagex, title: 'John Doe', details: loremIpsum),
            //       BiaNotificationTile(
            //         image: imagex,
            //         title: 'John Doe',
            //         details: loremIpsum,
            //         count: 2,
            //       ),
            //       BiaNotificationTile(
            //         image: imagex,
            //         title: 'John Doe',
            //         details: loremIpsum,
            //         count: 6,
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   //  margin: EdgeInsets.symmetric(vertical: 10.h),
            //   clipBehavior: Clip.hardEdge,
            //   padding: EdgeInsets.symmetric(vertical: 10.h),
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //   ),
            //   child: Column(
            //     children: const [
            //       BiaNotificationTile(
            //           image: imagex, title: 'John Doe', details: loremIpsum),
            //       BiaNotificationTile(
            //         image: imagex,
            //         title: 'John Doe',
            //         details: loremIpsum,
            //         count: 2,
            //       ),
            //       BiaNotificationTile(
            //         image: imagex,
            //         title: 'John Doe',
            //         details: loremIpsum,
            //         count: 6,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ));
  }
}
