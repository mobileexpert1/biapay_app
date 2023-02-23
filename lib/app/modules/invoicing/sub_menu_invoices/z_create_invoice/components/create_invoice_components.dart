
import 'package:biapay_app/app/modules/invoicing/sub_menu_invoices/z_create_invoice/controller/create_invoice_controller.dart';
import '../../../../../widgets/export_file.dart';

class CreateInvoiceComponent {

  Widget viewHolder(CreateInvoiceController controller, BuildContext context) {
    DateTime now = DateTime.now();

    controller.invoiceNumber.text = "${now.day.toString()}-"
        "${now.month.toString().padLeft(2, '0')}-"
        "${now.year.toString().padLeft(2, '0')}"
        "${controller.generateRandomString(8)}";

    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BiaText(
              LocaleKeys.invoice_number.tr,
              fontSize: 22.h,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<CreateInvoiceController>(builder: (controller) {return Container(
                  width: 250,
                  child: BiaText(
                    controller.invoiceNumber.text,
                    fontSize: 22.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                );}),
                GestureDetector(
                  onTap: () {
                    controller.onRefreshInvoiceNumber();
                  },
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        BiaDatePicker(controller: controller.invoiceDate, title: LocaleKeys.invoice_date.tr),
        SizedBox(height: 15),
        BiaTextField(
          controller: controller.orderNumber,
          hint: LocaleKeys.order_number.tr,
          padding: EdgeInsets.zero,
        ),
        SizedBox(height: 15),
        BiaDatePicker(controller: controller.dueDate, title: LocaleKeys.due_date.tr),
        SizedBox(height: 15),
        GetBuilder<CreateInvoiceController>(builder: (controller) {
          return BiaDropdown<String>(
            options: controller.customerElementList,
            margin: EdgeInsets.zero,
            hint: LocaleKeys.select_customer.tr,
            controller: controller.selectCustomer,
            displayName: (v) => {controller.getCustomerId(v)},
            onSelected: (v) => () {},
          );
        }),
        SizedBox(height: 15),
        GetBuilder<CreateInvoiceController>(builder: (controller) {
          return BiaDropdown<String>(
            options: controller.currencyElementList,
            margin: EdgeInsets.zero,
            hint: LocaleKeys.select_currency.tr,
            controller: controller.selectCurrency,
            displayName: (v) => {controller.getCurrencyId(v)},
            onSelected: (v) => () {},
          );
        }),
        SizedBox(height: 15),
        GetBuilder<CreateInvoiceController>(builder: (controller) {
          return BiaDropdown<String>(
            options: controller.shopElementList,
            margin: EdgeInsets.zero,
            hint: LocaleKeys.select_shop.tr,
            controller: controller.selectShop,
            displayName: (v) => {controller.getShopId(v)},
            onSelected: (v) => () {},
          );
        }),
        SizedBox(height: 15),
        GetBuilder<CreateInvoiceController>(builder: (controller) {
          return BiaDropdown<String>(
            options: controller.posElementList,
            margin: EdgeInsets.zero,
            hint: LocaleKeys.select_POS.tr,
            controller: controller.selectPOS,
            displayName: (v) => {controller.getPOSId(v)},
            onSelected: (v) => () {},
          );
        }),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.delivery_address.tr,
          padding: EdgeInsets.zero,
          maxLines: 3,
          controller: controller.deliveryAddress,
        ),
        separator(),
        GetBuilder<CreateInvoiceController>(builder: (controller) {
          return customFields(controller);
        }),
        SizedBox(height: 10),
        addButton(controller),
        separator(),
        bottomDetailView(),
        SizedBox(height: 25),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.white, width: 1)),
          width: MediaQuery.of(context).size.width / 2.25,
          child: TextButton(
              onPressed: () {
                controller.setFieldsMap();
              },
              child: BiaText(
                LocaleKeys.create_an_invoice.tr,
                fontSize: 20.h,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )),
        ),
      ],
    );
  }

  Widget customFields(CreateInvoiceController controller) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
          primary: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.descriptionArray.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  GetBuilder<CreateInvoiceController>(builder: (controller) {
                    return BiaDropdown<String>(
                      options: controller.productElementList,
                      margin: EdgeInsets.zero,
                      hint: LocaleKeys.select_item.tr,
                      controller: controller.selectProduct,
                      displayName: (v) => {controller.getProductId(v)},
                      onSelected: (v) => () {},
                    );
                  }),
                  SizedBox(height: 5),
                  BiaTextField(
                    hint: LocaleKeys.description.tr,
                    padding: EdgeInsets.zero,
                    controller: controller.descriptionController,
                  ),
                  SizedBox(height: 5),
                  BiaTextField(
                    hint: LocaleKeys.quantity.tr,
                    padding: EdgeInsets.zero,
                    controller: controller.quantityController,
                  ),
                  SizedBox(height: 5),
                  BiaTextField(
                    hint: LocaleKeys.price.tr,
                    padding: EdgeInsets.zero,
                    controller: controller.priceController,
                  ),
                  SizedBox(height: 5),
                  BiaSwitch(
                    title: LocaleKeys.discount.tr,
                    initValue: false,
                    onChanged: (value) {
                      controller.discountBool = !controller.discountBool;
                    },
                    padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  ),
                  SizedBox(height: 5),
                  BiaTextField(
                    hint: LocaleKeys.discountRate.tr,
                    padding: EdgeInsets.zero,
                    controller: controller.discountRateController,
                  ),
                  SizedBox(height: 5),
                  BiaTextField(
                    hint: LocaleKeys.discountAmount.tr,
                    padding: EdgeInsets.zero,
                    controller: controller.discountAmountController,
                    inputType: InputFieldType.number(),
                    onChanged: (text) {
                      controller.onDiscountChange(text);
                    },
                  ),
                  SizedBox(height: 5),
                  BiaTextField(
                    hint: LocaleKeys.shipping_fee.tr,
                    padding: EdgeInsets.zero,
                    controller: controller.shipping_feeController,
                  ),
                  SizedBox(height: 5),
                  BiaTextField(
                    hint: LocaleKeys.tax.tr,
                    padding: EdgeInsets.zero,
                    controller: controller.taxController,
                    inputType: InputFieldType.number(),
                    onChanged: (text) {
                      controller.onTaxFieldChange(text);
                    },
                  ),
                  SizedBox(height: 5),
                  BiaTextField(
                    hint: LocaleKeys.sub_total.tr,
                    padding: EdgeInsets.zero,
                    controller: controller.sub_totalController,
                    inputType: InputFieldType.number(),
                    onChanged: (text) {
                      controller.onSubTotalFieldChange(text);
                    },
                  ),
                  SizedBox(height: 15),
                  controller.descriptionArray.length == 1 ? SizedBox() : handleBottomActionsView(controller, index),
                  controller.descriptionArray.length == 1 ? SizedBox() : separator(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget addButton(CreateInvoiceController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(),
        Container(
          height: 35,
          width: 90,
          decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
          child: TextButton(
            child: BiaText(
              LocaleKeys.add.tr,
              color: Colors.white,
            ),
            onPressed: () {
              controller.description = controller.description + 1;
              controller.descriptionArray.add(controller.description);
              controller.update();
              controller.setCustomFieldsListData();
            },
          ),
        ),
      ],
    );
  }

  Widget deleteButton(CreateInvoiceController controller, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(),
        Container(
          height: 35,
          width: 90,
          decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
          child: TextButton(
            child: BiaText(
              LocaleKeys.delete.tr,
              color: Colors.white,
            ),
            onPressed: () {
              controller.descriptionArray.removeAt(index);
              controller.update();
            },
          ),
        ),
      ],
    );
  }

  Widget handleBottomActionsView(CreateInvoiceController controller, int index) {
    if (index == 0 && controller.descriptionArray.length == 1) {
      return addButton(controller);
    } else {
      return deleteButton(controller, index);
    }
  }

  Widget separator() {
    return Column(
      children: [
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            height: 2,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget bottomDetailView() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BiaText(
                      LocaleKeys.global_tax_amount.tr,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    BiaText(
                      "(${LocaleKeys.on_selling_price.tr})",
                      fontSize: 10,
                    ),
                  ],
                ),
                GetBuilder<CreateInvoiceController>(builder: (controller) {
                  return BiaText(
                    controller.global_tax_amount,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  );
                })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BiaText(
                      LocaleKeys.global_sub_total_amount.tr,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    BiaText(
                      "(excl. ${LocaleKeys.tax.tr})",
                      fontSize: 10,
                    ),
                  ],
                ),
                GetBuilder<CreateInvoiceController>(builder: (controller) {
                  return BiaText(
                    controller.global_sub_total_amount,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  );
                })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BiaText(
                      LocaleKeys.global_discount.tr,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    BiaText(
                      "(excl. ${LocaleKeys.shipping_fee.tr})",
                      fontSize: 10,
                    ),
                  ],
                ),
                GetBuilder<CreateInvoiceController>(builder: (controller) {
                  return BiaText(
                    controller.global_discount_amount,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  );
                })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BiaText(
                  LocaleKeys.total.tr,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                GetBuilder<CreateInvoiceController>(builder: (controller) {
                  return BiaText(
                    controller.total_amount,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
