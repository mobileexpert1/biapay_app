import 'package:biapay_app/app/modules/ecommerce/z_ecommerce_detail/ecommerce_detail_controller/ecommerce_detail_controller.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EcommerceDetailView extends GetView<EcommerceDetailController> {
  final List<String> imageList = [
    "https://www.prepostseo.com/imgs/social-imgs/fake-address-generator.png",
    "https://www.prepostseo.com/imgs/social-imgs/fake-address-generator.png",
    "https://www.prepostseo.com/imgs/social-imgs/fake-address-generator.png",
    "https://www.prepostseo.com/imgs/social-imgs/fake-address-generator.png"
  ];

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.ecommerce.tr, isShowFilter: false),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productSlider(),
                titleAndDescriptionView(context),
                categorySelection(context),
              ],
            ),
            GetBuilder<EcommerceDetailController>(builder: (controller) {
              return quantityView(context);
            }),
          ],
        ),
      bottomNav: goToCart(context),

    );
  }

  Widget productSlider() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        color: Colors.transparent,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 180,
            enlargeCenterPage: false,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: imageList
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: Container(
                    child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                        height: 200,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget titleAndDescriptionView(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: BiaText(
                      "Product Name",
                      maxLine: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
                Container(
                    width: 60,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: BiaText(
                          "65.00",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ))),
              ],
            ),
          ),
          productRating(context),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: BiaText(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              fontSize: 14,
              maxLine: 15,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget productRating(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        ignoreGestures: true,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 20,
        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }

  Widget categorySelection(BuildContext context) {
    return GetBuilder<EcommerceDetailController>(builder: (controller) {
      Color handleSelection(int selectedCellIndex) {
        if (controller.productSelection == true && controller.selectionCategoryIndex == selectedCellIndex) {
          return Colors.amber;
        }
        return Colors.white;
      }

      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) => Card(
              child: GestureDetector(
                onTap: () {
                  controller.productSelection = false;
                  controller.toggleSelection(index);
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: handleSelection(index), width: 3),
                    ),
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      child: Center(child: Text('150')),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget quantityView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: GetBuilder<EcommerceDetailController>(builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // 100 will be amount of product
                            controller.updateItemCount("delete", 50);
                          },
                          child: Container(
                            child: Center(
                                child: BiaText(
                              "-",
                              color: Colors.green,
                              fontSize: 30,
                            )),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 2),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            controller.updateItemCount("add", 50);
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, bottom: 10),
                              child: BiaText(
                                "+",
                                color: Colors.green,
                                fontSize: 28,
                              ),
                            ),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        BiaText(
                          "Quantity",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        BiaText(
                          controller.itemCount.toString(),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        BiaText(
                          "Price",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        BiaText(
                          controller.itemPrice.toString(),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  ],
                ),
              ),
             /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<EcommerceDetailController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      // send items here
                      controller.addToCartTapped();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green,
                      ),
                      height: 35,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: BiaText(
                        "Add to cart",
                        color: Colors.white,
                        fontSize: 16,
                      )),
                    ),
                  );
                }),
              )*/
            ],
          );
        }),
      ),
    );
  }

  Widget goToCart(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ECOMMERCECART);
      },
      child: Container(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                height: 40,
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Center(
                    child: BiaText(
                      "Add to cart",
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                height: 40,
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Center(
                    child: BiaText(
                  "Go to cart",
                  color: Colors.white,
                  fontSize: 16,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) => Card(
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Text('150'),
                ),
            ),
          ),
        ),
      ),
 */
