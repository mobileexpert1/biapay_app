import 'package:biapay_app/app/modules/invoicing/quotation/controller/quotation_controller.dart';
import 'package:biapay_app/app/widgets/export_file.dart';

class QuotationComponent {

  // these will be dynamic
  List<String> customerList = ["Customer 1",  "Customer 2"];
  List<String> shopList = ["Shop 1",  "Shop 2"];
  List<String> posList = ["POS 1",  "POS 2"];
  List<String> countryList = ["Country 1",  "Country 2"];

  Widget viewHolderComponent(BuildContext context, QuotationController controller) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      children: [
        titleView(context),

        BiaDropdown<String>(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            options: customerList,
            controller: controller.newInvoice,
            hint: LocaleKeys.select_customer.tr,
            displayName: (v) => v,
            onSelected: (v) {}),


        BiaDropdown<String>(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            options: shopList,
            controller: controller.selectShop,
            hint: LocaleKeys.select_shop.tr,
            displayName: (v) => v,
            onSelected: (v) {}),


        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BiaDatePicker(
            controller: controller.registeredDateController,
            title: LocaleKeys.delivery_date.tr,
          ),
        ),

        BiaTextField(
          hint: LocaleKeys.delivery_address.tr,
          padding: EdgeInsets.only(top: 15),
          maxLines: 3,
        ),

        BiaDropdown<String>(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            options: posList,
            controller: controller.selectYourPOS,
            hint: LocaleKeys.select_POS.tr,
            displayName: (v) => v,
            onSelected: (v) {}),

        BiaDropdown<String>(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            options: countryList,
            controller: controller.selectYourCountry,
            hint: LocaleKeys.select_your_country.tr,
            displayName: (v) => v,
            onSelected: (v) {}),

        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BiaDatePicker(
            controller: controller.invoiceDateController,
            title: LocaleKeys.invoice_date.tr,
          ),
        ),

        BiaTextField(
          hint: LocaleKeys.invoice_number.tr,
          padding: EdgeInsets.only(top: 15),
          maxLines: 1,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BiaDatePicker(
            controller: controller.dueDateController,
            title: LocaleKeys.due_date.tr,
          ),
        ),

        BiaTextField(
          hint: LocaleKeys.order_number.tr,
          padding: EdgeInsets.only(top: 15),
          maxLines: 1,
        ),

        bottomDetailView()

      ],
    );
  }

  Widget titleView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BiaText(
                LocaleKeys.profile_details.tr,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1)
                ),
                width: MediaQuery.of(context).size.width / 2.25,
                child: TextButton(
                    onPressed : (){},
                    child: BiaText(
                      LocaleKeys.add_customer.tr,
                      fontSize: 18.h,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomDetailView() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r)
        ),
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(LocaleKeys.global_discount.tr, fontSize: 15,),
                  BiaText("5465", fontSize: 15,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(LocaleKeys.global_coupon.tr, fontSize: 15,),
                  BiaText("5465", fontSize: 15,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(LocaleKeys.tax_1.tr, fontSize: 15,),
                  BiaText("5465", fontSize: 15,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(LocaleKeys.tax_2.tr, fontSize: 15,),
                  BiaText("5465", fontSize: 15,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(LocaleKeys.global_discount.tr, fontSize: 15,),
                  BiaText("5465", fontSize: 15,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(LocaleKeys.total.tr, fontSize: 15,),
                  BiaText("5465", fontSize: 15,),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

}