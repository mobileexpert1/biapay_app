import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/models/ticket_model.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book_event.dart';

class EventComponent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 15),
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
                  "Event-id",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.event_name.tr,secondTitle:"Event Name" ),

                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.location.tr,secondTitle:"Event Location" ),


                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.from_date.tr,secondTitle:"Event Date" ),

                SizedBox(
                  height: 5.h,
                ),
                rowItemwidget(firstTitle: LocaleKeys.to_date.tr,secondTitle:"Event Date" ),
                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.category.tr,secondTitle:"Event Category" ),
                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.price.tr,secondTitle:"10" ),


                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.tags.tr,secondTitle:"10",isShow: true ),
                Align(
                  alignment: Alignment.center,
                  child: bookNowWidget(),
                )


              ],
            ),
            //const Icon(Icons.more_horiz_rounded),
            popMenuItemWidget()
          ],
        ));
  }

  bookNowWidget(){
    return  InkWell(
      onTap: (){
        Get.to(()=>BookEventView());
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.h,left: 5.w,right: 30.w),
         padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h,bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.green.withOpacity(0.6)
        ),
        child: Center(child: BiaText(LocaleKeys.book_event.tr,color: Colors.white,fontSize: 16.sp)),
      ),
    );
  }



  rowItemwidget({firstTitle,secondTitle,isShow}){
    return  Row(
      children: [
        BiaText(
          '${firstTitle}:- ',
          fontWeight: FontWeight.bold,
        ),
        BiaText(
          "${secondTitle}",
        ),

       ],
    );
  }

  popMenuItemWidget(){
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        // popupmenu item 1
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Row(
            children: [
              Icon(Icons.login),
              SizedBox(
                // sized box with width 10
                width: 10,
              ),
              Text(LocaleKeys.print.tr)
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          // row has two child icon and text
          child: Row(
            children: [
              Icon(Icons.download_sharp),
              SizedBox(
                // sized box with width 10
                width: 10,
              ),
              Text(LocaleKeys.download_pdf.tr)
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          // row has two child icon and text
          child: Row(
            children: [
              Icon(Icons.print),
              SizedBox(
                // sized box with width 10
                width: 10,
              ),
              Text(LocaleKeys.print.tr)
            ],
          ),
        )

      ],
      offset: Offset(-10, 10),
      color: Colors.white.withOpacity(1),
      elevation: 5,
    );
  }

}
