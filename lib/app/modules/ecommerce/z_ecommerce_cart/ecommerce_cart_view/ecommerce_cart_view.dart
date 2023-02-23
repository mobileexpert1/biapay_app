
import 'package:biapay_app/app/widgets/export_file.dart';
// import 'package:stripe_package/stripe_package.dart';
import '../../z_ecommerce_detail/ecommerce_detail_controller/ecommerce_detail_controller.dart';
import '../ecommerce_cart_controller/ecommerce_cart_controller.dart';

class EcommerceCartView extends GetView<EcommerceCartController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.ecommerce.tr, isShowFilter: false),
        body: cartListView(),
        bottomNav: bottomNavBar(context));
  }

  Widget cartListView() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: 10,
        itemBuilder: (c, i) {
          return cartViewCell();
        });
  }

  Widget cartViewCell() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/dummy.jpeg",
                        fit: BoxFit.fill,
                      ),
                      height: 70,
                      width: 85,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BiaText(
                            "Product title",
                            fontSize: 15,
                          ),
                          Container(
                              width: 170,
                              child:
                                  BiaText("Product description", maxLine: 3)),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              BiaText("QT."),
                              BiaText("3"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              BiaText("PRICE"),
                              BiaText("200"),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 1,
              top: 0,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(Icons.cancel_rounded,
                      color: Color.fromRGBO(39, 59, 112, 1))))
        ],
      ),
    );
  }

  Widget bottomNavBar(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      child: GetBuilder<EcommerceDetailController>(builder: (controller)  {
          return Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BiaText(
                      "Total Items",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    BiaText(
                      controller.itemCount.toString(),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BiaText(
                        "Total Price",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      BiaText(
                        controller.itemPrice.toString(),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
               GestureDetector (onTap: (){},
                  child: Container(
                    height: 35,
                    child: Center(
                        child: BiaText(
                      "Buy Now",
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(39, 59, 112, 1),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
