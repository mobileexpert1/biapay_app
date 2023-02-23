
import 'package:biapay_app/app/modules/invoicing/sub_menu_product/z_add_product/controller/add_product_controller.dart';

import '../../../../../widgets/export_file.dart';

class AddProductComponent {

  Widget viewHolder(AddProductController controller, BuildContext context){
    return ListView(
        children: [
          BiaTextField(
            hint: LocaleKeys.name.tr,
            padding: EdgeInsets.zero,
            controller: controller.name,
          ),
          SizedBox(height: 5),
          GetBuilder<AddProductController>(builder: (controller){
            return BiaSwitch(initValue: true, onChanged: (v) {
              controller.isListed = !controller.isListed;
            }, title: "Is Listed");
          }),
          SizedBox(height: 5),
          GetBuilder<AddProductController>(builder: (controller){
            return BiaDropdown<String>(
              options: controller.currencyElementList,
              margin: EdgeInsets.zero,
              hint: LocaleKeys.currency.tr,
              controller: controller.currency,
              displayName: (v) => v,
              onSelected: (v) => controller.getCurrencyId(v),
            );
          }),
          SizedBox(height: 15),
          BiaTextField(
            hint: "Tax",
            padding: EdgeInsets.zero,
            controller: controller.tax,
          ),
          SizedBox(height: 15),
          BiaTextField(
            hint: LocaleKeys.description.tr,
            padding: EdgeInsets.zero,
            controller: controller.description,
            maxLines: 3,
          ),
          SizedBox(height: 15),
          BiaTextField(
            hint: LocaleKeys.salesPrice.tr,
            padding: EdgeInsets.zero,
            controller: controller.salesPrice,
          ),
          SizedBox(height: 15),
          BiaTextField(
            hint: LocaleKeys.purchasePrice.tr,
            padding: EdgeInsets.zero,
            controller: controller.purchasePrice,
          ),
          SizedBox(height: 15),
          BiaTextField(
            hint: LocaleKeys.category.tr,
            padding: EdgeInsets.zero,
            controller: controller.category,
          ),

          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 1)
            ),
            width: MediaQuery.of(context).size.width / 2.25,
            child: TextButton(
                onPressed : (){
                  controller.pickImage();
                },
                child: BiaText(
                  LocaleKeys.upload_image.tr,
                  fontSize: 20.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
          ),
          SizedBox(height: 5),
          Center(
            child: BiaText(
              "1 or 2 image is allowed",
              fontSize: 17.h,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          controller.image.value == null
              ? SizedBox() : Column(
            children: [
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width/2,
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      width: MediaQuery.of(context).size.width/2 - 25,
                        decoration: BoxDecoration(
                          image: controller.image.value == null
                              ? null
                              : DecorationImage(
                            image:
                            FileImage(controller.image.value!),
                            fit: BoxFit.cover,
                          ),

                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 1)
            ),
            width: MediaQuery.of(context).size.width / 2.25,
            child: TextButton(
                onPressed : (){
                  controller.setFieldsMap();
                },
                child: BiaText(
                  LocaleKeys.add_product.tr,
                  fontSize: 20.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
          ),
        ]
    );
  }
}