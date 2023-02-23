import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/models/ticket_model.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/merchant_generate_pay.dart';

class GeneratePayLinkView extends StatelessWidget {
  GeneratePayLinkDataModel? generatePayLinkDataModel;
  Function(GeneratePayLinkDataModel model)? onSelected;
  GeneratePayLinkView({required this.generatePayLinkDataModel,this.onSelected});


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
                // Row(
                //   children: const [
                //     BiaText(
                //       'Merchanr/User:- ',
                //       fontWeight: FontWeight.bold,
                //     ),
                //     BiaText(
                //       'Lorem Ispum',
                //     )
                //   ],
                // ),
                // SizedBox(
                //   height: 5.h,
                // ),
                Row(
                  children: [
                    BiaText(
                      '${LocaleKeys.customer_name.tr} :- ',
                      fontWeight: FontWeight.bold,
                    ),
                    BiaText(
                      generatePayLinkDataModel?.customerName ?? "",
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    BiaText(
                      '${LocaleKeys.pos_name.tr}:- ',
                      fontWeight: FontWeight.bold,
                    ),
                    BiaText(
                      generatePayLinkDataModel?.merchantPOS?.name ?? "",
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    BiaText(
                      '${LocaleKeys.mobile_number.tr}:- ',
                      fontWeight: FontWeight.bold,
                    ),
                    BiaText(
                      generatePayLinkDataModel?.mobileNumber?.toString() ?? '',
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 5.h,
                ),

                Row(
                  children: [
                    BiaText(
                      '${LocaleKeys.currency.tr}:- ',
                      fontWeight: FontWeight.bold,
                    ),
                    BiaText(
                      generatePayLinkDataModel?.currency?.toString() ?? '',
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),

                Row(
                  children: [
                    BiaText(
                      '${LocaleKeys.customer_email.tr}:- ',
                      fontWeight: FontWeight.bold,
                    ),
                    BiaText(
                      generatePayLinkDataModel?.email?.toString() ?? '',
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),

                Row(
                  children: [
                    BiaText(
                      '${LocaleKeys.amount.tr}:- ',
                      fontWeight: FontWeight.bold,
                    ),
                    BiaText(
                      generatePayLinkDataModel?.amount?.toString() ?? '',
                    )
                  ],
                ),


                SizedBox(
                  height: 5.h,
                ),

                Row(
                  children: [
                    BiaText(
                      '${LocaleKeys.status.tr}:- ',
                      fontWeight: FontWeight.bold,
                    ),
                    BiaText(
                      generatePayLinkDataModel?.status?.toString() ?? '',
                    )
                  ],
                ),


                SizedBox(
                  height: 5.h,
                ),

                Row(
                  children: [
                    BiaText(
                      '${LocaleKeys.date.tr}:- ',
                      fontWeight: FontWeight.bold,
                    ),
                    BiaText(Get.parseDate( generatePayLinkDataModel?.createdDate, "dd MMM yyyy") ??
                        ""),
                  ],
                ),
              ],
            ),
            //const Icon(Icons.more_horiz_rounded),
            popMenuItemWidget()
          ],
        ));
  }

  popMenuItemWidget() {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        // popupmenu item 1
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Row(
            children: [
              Icon(Icons.edit),
              SizedBox(
                // sized box with width 10
                width: 10,
              ),
              Text(LocaleKeys.edit_link.tr)
            ],
          ),
        ),
      ],
      offset: Offset(-10, 10),
      onSelected: (selectedIndex) async{
        if(onSelected!=null){
          onSelected!(generatePayLinkDataModel!);
        }
      /* var data=await Get.toNamed(Routes.GENERATE_PAY_LINK_VIEW, arguments:generatePayLinkDataModel);
        if(data!=null){
          generatePayLinkDataModel=data;

        }
     */
      },
      color: Colors.white.withOpacity(1),
      elevation: 5,
    );
  }
}
