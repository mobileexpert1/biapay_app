import 'package:biapay_app/app/widgets/helper_widget.dart';

import '../../../widgets/export_file.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      resizeToAvoidBottomInset: false,
        appBar: BiaAppBar(
          centerTitle: false,
          showAction: false,
          showIcon: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),

            emailAdressTextFiled(),
            SizedBox(
              height: 10.h,
            ),

            SizedBox(
              height: 10.h,
            ),
            // customerTypeWidget(),
            customerTypeTextFieldWidget(),

            SizedBox(
              height: 30.h,
            ),
            forgotButton(),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: spanTextWidget(
                    firstTitle: LocaleKeys.back_to.tr,
                    secTitle: LocaleKeys.login.tr),
              ),
            ),
          ],
        ));
  }

  customerTitleWidget() {
    return BiaText(
      LocaleKeys.customer_type.tr,
      align: TextAlign.center,
      fontSize: 24.sp,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    );
  }

  emailAddressWidget() {
    return BiaText(
      LocaleKeys.email_address_enter.tr,
      align: TextAlign.center,
      fontSize: 25.sp,
      fontWeight: FontWeight.w500,
      textType: TextType.body2,
      color: Colors.white,
    );
  }

  emailAdressTextFiled() {
    return BiaTextField(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
      inputType: const InputFieldType.email(),
      controller: controller.emailController,
      hint: LocaleKeys.email_address.tr,
      label: LocaleKeys.email_address_enter.tr,
    );
  }

  customerTypeWidget() {
    return BiaText(
      LocaleKeys.customer_type.tr,
      align: TextAlign.center,
      fontSize: 25.sp,
      fontWeight: FontWeight.w500,
      textType: TextType.body2,
      color: Colors.white,
    );
  }

  customerTypeTextFieldWidget() {
    return BiaTextField(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
      inputType: const InputFieldType.email(),
      controller: controller.customeTypeController,
      hint: LocaleKeys.customer_type.tr,
      enabled: false,
      label: LocaleKeys.customer_type.tr,
    );
  }

  customerTypeTxtWidget() {
    return BiaText(
      controller.selecedDropDownValue.tr,
      align: TextAlign.center,
      fontSize: 23.sp,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    );
  }

  customTypeListWidget() {
    return Obx(
      () {
        return Visibility(
          visible: controller.isvisible.value,
          child: Container(
            padding: EdgeInsets.all(10.h),
            margin: EdgeInsets.only(top: 10.h),
            color: Colors.white,
            height: 120.h,
            child: ListView.builder(
                itemCount: controller.customList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customerItemTxtWidget(
                          text: controller.customList?[index]),
                      Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      index == 1
                          ? SizedBox()
                          : SizedBox(
                              height: 2,
                            )
                    ],
                  );
                }),
          ),
        );
      },
    );
  }

  customerItemTxtWidget({String? text}) {
    return BiaText(
      text?.tr,
      align: TextAlign.start,
      fontSize: 23.sp,
      padding: EdgeInsets.only(left: 0.0),
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  forgotButton() {
    return BiaButton(
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.0),
      text: LocaleKeys.next.tr,
      textColor: Colors.white,
      color: Theme.of(Get.context!).colorScheme.secondary,
      onPressed: () {
        controller.validateTextFields();
      },
    );
  }
}
