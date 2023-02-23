// import 'package:biapay_app/presentation/app/home/chart/ornob/add_new_tickets.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/common/bia_appbar.dart';
import '../../../../widgets/common/bia_scaffold.dart';
import '../../../../widgets/common/bia_text.dart';

class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple('Ticket'),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 70.h,
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.h, color: Colors.white),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(
                    "Search in records...",
                    color: Colors.white,
                    fontSize: 20.h,
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 80.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(
                    'Ticket list',
                    fontSize: 24.h,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  TextButton(
                      onPressed: () {
                        // Get.to(() => const AddNewTickets());
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 35.h,
                          ),
                          BiaText(
                            'Add ticket',
                            fontSize: 20.h,
                            color: Colors.white,
                          )
                        ],
                      )),
                ],
              ),
            ),
            Container(
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
                          'ESA45867434tyt',
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Merchanr/User:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Subject:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Status:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Pending',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Priority:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Date:- ',
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
                          'ESA45867434tyt',
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Merchanr/User:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Subject:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Status:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Pending',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Priority:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Date:- ',
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
                          'ESA45867434tyt',
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Merchanr/User:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Subject:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Status:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Pending',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Priority:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Date:- ',
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
                          'ESA45867434tyt',
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Merchanr/User:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Subject:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Status:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Pending',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Priority:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Date:- ',
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
                          'ESA45867434tyt',
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Merchanr/User:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Subject:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Status:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Pending',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Priority:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Date:- ',
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
                          'ESA45867434tyt',
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Merchanr/User:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Subject:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Status:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Pending',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Priority:- ',
                              fontWeight: FontWeight.bold,
                            ),
                            BiaText(
                              'Lorem Ispum',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: const [
                            BiaText(
                              'Date:- ',
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
      ),
    );
  }
}
