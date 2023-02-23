import '../../../routes/app_pages.dart';
import '../../../widgets/export_file.dart';
import '../controllers/request_money_controller.dart';

class SendMoneyView extends GetView<RequestMoneyController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RequestMoneyController>();
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.send_money.tr),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            receipentTextFieldWidget(),
            recipentEmailWidget(),
            headingTextWidget(title: LocaleKeys.payment_method.tr),
            paymetDropDownWidget(),
          feeTextFieldWidget(),
            amountTextFieldWidget(),
            headingTextWidget(title: LocaleKeys.currency.tr),
            paymetDropDownWidget(),
            notesWidget(),
            SizedBox(height: 25.h,),
            showSummaryWidget(),
            SizedBox(height: 30.h,),


          ],
        ),
      ),
    );
  }

  receipentTextFieldWidget() {
    return BiaTextField(
        padding: EdgeInsets.symmetric(horizontal: 26.h),
        inputType: const InputFieldType.phone(),
        // controller: _phone,
        enabled: false,
        hint: LocaleKeys.enter_mobile_number.tr,
        label: LocaleKeys.recipent_mobile_number.tr);
  }

  recipentEmailWidget() {
    return
      BiaTextField(
        hint: LocaleKeys.enter_email.tr,
        label: LocaleKeys.recipent_email.tr,
      );
  }

  paymetDropDownWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10.w, top: 10.h),
      child: BiaDropdown<String>(
          options: controller.testList,
          showBorder: true,
          outerLabel: false,
          controller: controller.paymentMethodController,
          hint: LocaleKeys.select_event_owner.tr,
          displayName: (v) => v,
          onSelected: (v) {}),
    );
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

  feeTextFieldWidget() {
    return
      BiaTextField(
        hint: '0.0',
        label: LocaleKeys.fee.tr,
      );
  }

  amountTextFieldWidget() {
    return
      BiaTextField(
        hint: '0.0',
        label: LocaleKeys.amount.tr,
      );
  }



  notesWidget() {
    return BiaTextField(
      hint: LocaleKeys.write_a_message.tr,
      label: LocaleKeys.notes.tr,
      maxLines: 5,
    );
  }

  showSummaryWidget(){
    return BiaButton.greenButtonInRow(
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal:10.w),
        text: LocaleKeys.show_summary.tr, onPressed: (){
      Get.toNamed(Routes.SHOW_SEND_SUMMARY);
    });
  }
}