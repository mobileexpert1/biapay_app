import 'package:biapay_app/app/modules/settlement/sub_menu_settlement_report/controller/settlement_report_controller.dart';
import 'package:biapay_app/app/widgets/export_file.dart';

import '../../../../routes/app_pages.dart';

class SettlementReportComponents {

  List<String> titles = ["Date", LocaleKeys.utr_number.tr, LocaleKeys.sales_amount.tr,
    LocaleKeys.deduction.tr, LocaleKeys.settled_amount.tr];


  Widget reportDetailView(SettlementReportController controller) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: BiaDatePicker(controller: controller.searchUtr, title: LocaleKeys.search_utr.tr),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            height: 180.h,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BiaText(
                        LocaleKeys.total_sales.tr,
                        fontSize: 13,
                      ),
                      BiaText(
                        "56565",
                        fontSize: 13,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BiaText(
                        LocaleKeys.sales_amount.tr,
                        fontSize: 13,
                      ),
                      BiaText(
                        "6566565",
                        fontSize: 13,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BiaText(
                        LocaleKeys.settled_amount.tr,
                        fontSize: 13,
                      ),
                      BiaText(
                        "656565",
                        fontSize: 13,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BiaText(
                        LocaleKeys.download.tr,
                        fontSize: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.download),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        returnViewList(titles.length, titles, titles)
      ],
    );
  }


  Widget returnViewList(int viewCount, List<String> itemTitleKey, List<String> itemTitleValue) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        shrinkWrap: true,
        primary: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: viewCount,
        itemBuilder: (c, i) {
          return viewHolder(itemTitleKey, itemTitleValue);
        },
      ),
    );
  }

  Widget viewHolder(List<String> itemTitleKey, List<String> itemTitleValue) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SETTLEMENTREPORTDETAIL);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (String item in itemTitleKey)
                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        child: BiaText(item, fontWeight: FontWeight.w700),
                      )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (String item in itemTitleValue)
                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        child: BiaText(item),
                      )
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

}