import '../../../../../widgets/export_file.dart';

class SettlementDetailComponent {

  List<String> titles = [LocaleKeys.utr_number.tr, LocaleKeys.succeededOn.tr, LocaleKeys.totalTransaction.tr];
  List<String> settlementBreakUp = [
    LocaleKeys.total_sales_amount.tr,
    LocaleKeys.total_refund_amount.tr,
    LocaleKeys.adjustments.tr,
    LocaleKeys.payFee.tr,
    LocaleKeys.tax.tr,
    LocaleKeys.settled_amount.tr
  ];
  List<String> accountDetails = [LocaleKeys.account_number.tr, "IFSC Code"];

  Widget detailView() {
    return ListView(
      shrinkWrap: true,
      primary: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            height: 200.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BiaText(
                            "464",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          BiaText(
                            LocaleKeys.settled_amount.tr,
                            fontSize: 11,
                          )
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BiaText(
                          titles[0],
                          fontWeight: FontWeight.w600,
                        ),
                        BiaText(titles[0]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BiaText(
                          titles[1],
                          fontWeight: FontWeight.w600,
                        ),
                        BiaText(titles[1]),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BiaText(
                        titles[2],
                        fontWeight: FontWeight.w600,
                      ),
                      BiaText(titles[2]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BiaText(
            LocaleKeys.settlement_break_up.tr,
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        returnViewList(1, settlementBreakUp, settlementBreakUp),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BiaText(
            LocaleKeys.account_detail.tr,
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        returnViewList(1, accountDetails, accountDetails),
      ],
    );
  }

  Widget returnViewList(int viewCount, List<String> itemTitleKey, List<String> itemTitleValue) {
    return ListView.builder(
      shrinkWrap: true,
      primary: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: viewCount,
      itemBuilder: (c, i) {
        return viewHolder(itemTitleKey, itemTitleValue);
      },
    );
  }

  Widget viewHolder(List<String> itemTitleKey, List<String> itemTitleValue) {
    return Padding(
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
    );
  }
}