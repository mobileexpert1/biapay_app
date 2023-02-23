import 'package:biapay_app/app/modules/transaction/views/transaction_component.dart';

import '../../../widgets/export_file.dart';
import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  var controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      drawer: Menu.demo(context),

      appBar:
      // BiaAppBar.simple(LocaleKeys.transactions.tr),
      BiaAppBar(
          showAction: false,
          isShowFilter: true,
          filterWidget: popMenuItemWidget()),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70.h,
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.4.h, color: Colors.white),
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
                    LocaleKeys.search_records.tr,
                    color: Colors.white,
                    fontSize: 20.h,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ],
              ),
            ),


            applyConditionFilterWidget(context),
            headingTextWidget(title: LocaleKeys.transaction_list.tr),
            Expanded(
              child: controller.loading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: 0,
                      itemBuilder: (c, i) {
                        return TransactionComponent();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  headingTextWidget({title}) {
    return Align(
      alignment: Alignment.topLeft,
      child: BiaText(
        title ?? "",
        fontSize: 25.h,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  applyConditionFilterWidget(context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h,  left: 5.w, right: 5.w),
      //padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.white, width: 0),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          datPickerWidget(),
          currencyDropDownWidget(),
          selectStatusDropDownWidget(),
          SizedBox(
            height: 10.h,
          ),
          fetchDatabutton(context),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  datPickerWidget() {
    return Row(
      children: [
        Expanded(
            child: BiaDatePicker(
                controller: controller.fromController,
                title: LocaleKeys.from.tr)),
        SizedBox(width: 10.w),
        Expanded(
            child: BiaDatePicker(
                controller: controller.toController, title: LocaleKeys.to.tr)),
      ],
    );
  }

  currencyDropDownWidget() {
    return BiaDropdown<String>(
        margin: EdgeInsets.only(top: 10.h),
        options: controller.currencyList.value,
        showBorder: true,
        outerLabel: false,
        controller: controller.currencyController,
        hint: LocaleKeys.select_currency.tr,
        displayName: (v) => v,
        onSelected: (v) {});
  }

  selectStatusDropDownWidget() {
    return BiaDropdown<String>(
        margin: EdgeInsets.only(top: 10.h),
        options: controller.statusDollerList,
        showBorder: true,
        outerLabel: false,
        controller: controller.selectStatusController,
        hint: LocaleKeys.select_status.tr,
        displayName: (v) => v,
        onSelected: (v) {});
  }

  fetchDatabutton(context) {
    return BiaButton(
        margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
        text: LocaleKeys.fetch.tr,
        textColor: Colors.white,
        color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          controller.validateAllFields();
        });
  }
}
