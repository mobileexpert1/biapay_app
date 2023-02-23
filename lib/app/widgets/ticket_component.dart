import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/models/ticket_model.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketComponent extends StatelessWidget {
  const TicketComponent({Key? key, required this.ticket}) : super(key: key);
  final Ticket ticket;

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
                  ticket.ticketNo,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
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
                      '${LocaleKeys.title.tr} :- ',
                      fontWeight: FontWeight.bold,
                    ),
                    BiaText(
                      ticket.title ?? "",
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
                      ticket?.status ?? "",
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    BiaText(
                      '${LocaleKeys.priority.tr}:- ',
                      fontWeight: FontWeight.bold,
                    ),
                    BiaText(
                      ticket.priority ?? '',
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
                    BiaText(Get.parseDate( ticket.createdDateTime, "dd MMM yyyy") ??
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
              Text(LocaleKeys.edit_ticket.tr)
            ],
          ),
        ),
      ],
      offset: Offset(-10, 10),
      onSelected: (selectedIndex) {
        Get.toNamed(Routes.NEW_TICKETS, arguments: ticket);
      },
      color: Colors.white.withOpacity(1),
      elevation: 5,
    );
  }
}
