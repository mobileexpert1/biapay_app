import '../../../widgets/export_file.dart';
import '../controllers/event_controller.dart';

class BookEventView extends StatelessWidget {

  final controller = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.book_event.tr),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            headingTextWidget(title: LocaleKeys.tier.tr),
            tierDropDownWidget(),
            numberOfTicketWidget(),
            netBillWidget(),
            availBalanceWidget(),
            confirmButtonWidget(),

           ],
        ),
      ),
    );
  }


  confirmButtonWidget(){
    return   BiaButton.greenButtonInRow(
        width: Get.width,
        margin: EdgeInsets.symmetric(vertical: 30.h,horizontal: 20.w),
        text: LocaleKeys.confirm_txt.tr, onPressed: () {});
  }

  headingTextWidget({title}) {
    return BiaText(
      title ?? "",
      color: Colors.white,
      textType: TextType.headLine6,
      fontWeight: FontWeight.w300,
      padding: EdgeInsets.only(left: 15.w, top: 10.h),
    );
  }


  tierDropDownWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10.w, top: 10.h),
      child: BiaDropdown<String>(
          options: controller.testList,
          showBorder: true,
          outerLabel: false,
          controller: controller.currencyController,
          hint: LocaleKeys.select_currency.tr,
          displayName: (v) => v,
          onSelected: (v) {}),
    );
  }

  numberOfTicketWidget() {
    return BiaTextField(
      controller: controller.eventTitleController,
      hint: LocaleKeys.number_of_ticket.tr,
      label: LocaleKeys.enter_number_of_ticket.tr,
    );
  }
 netBillWidget() {
    return BiaTextField(
      enabled: false,
      controller: controller.eventTitleController,
      hint: "12.00",
      label: LocaleKeys.net_bill.tr,
    );
  }


  availBalanceWidget() {
    return BiaTextField(
      enabled: false,
      controller: controller.eventTitleController,
      hint: "12.00",
      label: LocaleKeys.available_balance.tr,
    );
  }

}
