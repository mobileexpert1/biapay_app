import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/models/ticket_model.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/payink_model.dart';


class PayLinkComponent extends StatelessWidget {
  PayLinkDataModel payLinkDataModel;
  PayLinkComponent(this.payLinkDataModel);
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

                SizedBox(
                  height: 10.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.created_date.tr,secondTitle:payLinkDataModel?.createdDate??"" ),

                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.customer_name.tr,secondTitle:payLinkDataModel?.customerName??"" ),


                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.pos_name.tr,secondTitle:payLinkDataModel?.merchantPOS!.name??"" ),

                SizedBox(
                  height: 5.h,
                ),
                rowItemwidget(firstTitle: LocaleKeys.customer_mobile_no.tr,secondTitle:payLinkDataModel?.mobileNumber??"" ),
                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.customer_email.tr,secondTitle: payLinkDataModel?.email??""),
                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.amount.tr,secondTitle:payLinkDataModel?.amount??"" ),


                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.currency.tr,secondTitle:payLinkDataModel?.currency??"",isShow: true ),
                SizedBox(
                  height: 5.h,
                ),

                rowItemwidget(firstTitle: LocaleKeys.status.tr,secondTitle:payLinkDataModel?.status??"",isShow: true ),
               /* Align(
                  alignment: Alignment.center,
                  child: bookNowWidget(),
                )*/


              ],
            ),
            //const Icon(Icons.more_horiz_rounded),
          //  popMenuItemWidget()
          ],
        ));
  }

  bookNowWidget(){
    return  InkWell(
      onTap: (){

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
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.login),
              SizedBox(
                width: 10.w,
              ),
              Text(LocaleKeys.export_xlsx.tr)
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
                width: 10.w,
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
                width: 10.w,
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
