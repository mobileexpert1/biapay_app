// import 'package:biapay_app/presentation/app/home/chart/batch4/cash_vouchers.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch4/chat_screen.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch4/my_mails.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch4/play_tutorials.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch4/tortine_history.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch4/whats_new.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch5/select_address.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/add_new_sub_tortine.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/add_new_tortine.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/authentication_service.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/biometric.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/change_password.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/contacts.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/create_sub_tontine.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/delete_member.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/jackpot_transfer.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/language.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/member_list.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/members_contribution.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/my_account.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/notification_options.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/pending_approval.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/reactive_member.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/settings.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/sub_totine.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/suspend_member.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch6/tontine.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch7/create_ticket.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch7/exchange_rate.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch7/ticket_info.dart';
// import 'package:biapay_app/presentation/app/home/chart/batch7/ticket_list.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class UIList extends StatelessWidget {
//   const UIList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('UI List'),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Cash Voucher",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const CashVoucher()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Chat Screen",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => ChatScreen()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "My Mails",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => MYMails()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Play Turorials",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => PlayTutorials()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Tortine History",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => TortoinHis()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "What's New",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const WhatNew()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Select Address",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SelectAddress()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Add new Sub Tortine",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => AddSubTortine()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Add New Tortine",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => AddNewTortine()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Authentication Service",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => AuthenticationService()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Background Picture",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => AuthenticationService()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Biometric",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Biometric()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Change Password",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ChangePassword()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Contacts",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Contacts()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Create Sub Tortine",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => CreateSub()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Delete Member",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => DeleteMember()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Jackpot Transfer",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => JackpotTransfer()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Language",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => language()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Member List",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => MemberList()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Members Contribution",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => MembersContribution()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Notification Options",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => NotificationOptions()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Pending Approval",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => PendingApprval()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Reactive Member",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ReactiveMember()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Settings",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Settings()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Sub Totine",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => SubTotine()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Suspend Member",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => SuspendMember()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Tontine",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Tontine()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "My Accounts",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => MyAccounts()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Create Ticket",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => CreateTicket()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Exchange Rate",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ExchangeRate()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Ticket Info",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => TicketInfo()),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                   child: BiaButton.withRightArrow(
//                       text: "Ticket List",
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => TicketList()),
//                         );
//                       }),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
