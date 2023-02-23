import 'package:biapay_app/app/modules/pricing/sub_menu_billing/controller/billing_controller.dart';
import '../../../../widgets/export_file.dart';

class BillingComponents {
  List<String> plans = [
    LocaleKeys.invoiceNo.tr,
    LocaleKeys.invoice_period.tr,
    LocaleKeys.description.tr,
    LocaleKeys.add_ons.tr,
    LocaleKeys.paid_date.tr,
    LocaleKeys.paid_amount.tr,
    LocaleKeys.invoice.tr,
    ""
  ];
  List<String> responsePlans = ["Invoice #", "Invoice Period", "Description", "Add-ons", "Paid Date", "Paid Amount", "Invoice", "Payment received"];
  BillingController controller = Get.put(BillingController());

  Widget billingViewList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      children: [titleView(), existingPlanView(context), invoiceTabButtons(context), returnViewList(plans.length, plans, responsePlans)],
    );
  }

  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: BiaText(
        LocaleKeys.plan_details.tr,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Widget existingPlanView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BiaText(
              LocaleKeys.existing_plan.tr,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            BiaText(
              "Existing Plan",
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 10,
            ),
            BiaText(
              LocaleKeys.default_string.tr,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            BiaText(
              "default",
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 10,
            ),
            BiaText(
              LocaleKeys.payment_method.tr,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            BiaText(
              "PayPal",
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }

  Widget invoiceTabButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => tabButton(
                  context,
                  controller.isDueInvoiceSelected.isTrue
                      ? Border.all(color: Colors.transparent, width: 1.5)
                      : Border.all(color: Colors.white, width: 1.5),
                  controller.isDueInvoiceSelected.isTrue ? Colors.white : Colors.transparent,
                  LocaleKeys.due_invoices.tr,
                  controller.isDueInvoiceSelected.isTrue ? Colors.black : Colors.white, onPressed: () {
                controller.isDueInvoiceSelected.value = !controller.isDueInvoiceSelected.value;
                controller.update();
              })),
          Obx(() => tabButton(
                  context,
                  controller.isDueInvoiceSelected.isTrue
                      ? Border.all(color: Colors.white, width: 1.5)
                      : Border.all(color: Colors.transparent, width: 1.5),
                  controller.isDueInvoiceSelected.isTrue ? Colors.transparent : Colors.white,
                  LocaleKeys.paid_invoices.tr,
                  controller.isDueInvoiceSelected.isTrue ? Colors.white : Colors.black, onPressed: () {
                controller.isDueInvoiceSelected.value = !controller.isDueInvoiceSelected.value;
                controller.update();
              }))
        ],
      ),
    );
  }

  Widget tabButton(BuildContext context, BoxBorder borderView, Color bgColor, String btnTitle, Color btnTextClr, {Function? onPressed}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), border: borderView, color: bgColor),
      width: MediaQuery.of(context).size.width / 2.4,
      child: TextButton(
        child: BiaText(
          btnTitle,
          color: btnTextClr,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        onPressed: () {
          onPressed!();
        },
      ),
    );
  }

  Widget returnViewList(int viewCount, List<String> itemTitleKey, List<String> itemTitleValue) {
    return ListView.builder(
      shrinkWrap: true,
      primary: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: plans.length,
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
