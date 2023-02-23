import 'package:biapay_app/app/widgets/export_file.dart';

import '../controller/pricing_list_controller.dart';

class PricingListComponents {

  List<String> requestedPlanDetail =
  ["Requested Plan Name", "Requested Date", "POS", "End Date", "Status"];

  Widget titleText(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: BiaText(LocaleKeys.requestedPlans.tr, fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white,)
      ),
    );
  }

  Widget requestedPlanList(PricingListController controller) {
    return Container(
      height: (130.0 * controller.pricingList.length) + (12 * controller.pricingList.length),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black38,
                width: 1
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
            shrinkWrap: true,
            primary: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.pricingList.length,
            itemBuilder: (c, i) {
              List<String> planDetailValues = [];
              if (planDetailValues != null) {
                planDetailValues.clear();
              }
              planDetailValues.add(controller.pricingList[i].subscriptionPlan!.subscriptionName.toString());
              planDetailValues.add(controller.pricingList[i].subscriptionStartDate.toString());
              planDetailValues.add(controller.pricingList[i].merchantPos!.name.toString());
              planDetailValues.add(controller.pricingList[i].subscriptionEndDate.toString());
              planDetailValues.add(
                  controller.pricingList[i].merchantPos!.status == true ? "Active" : "Not Active");
              return viewHolder(planDetailValues);
            },
          ),
        ),
      ),
    );
  }
  Widget viewHolder(List<String> itemTitleValue) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black38, width: 1),
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (String item in requestedPlanDetail)
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

  Widget availablePlanList(BuildContext context, PricingListController controller) {
    return ListView.builder(
      shrinkWrap: true,
      primary: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.pricingFeaturedList.length,
      itemBuilder: (c, i) {
        return availablePlanCell(context, i, controller);
      },
    );
    // return availablePlanCell(context);
  }

  Widget availablePlanCell(BuildContext context, int index, PricingListController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              availablePlanHeader(context, controller, index),
              availablePlanFeatureList(controller, index),
              availablePlanViewBottomButtons(index)
            ],
          ),
        ),
      ),
    );
  }
  Widget availablePlanHeader(BuildContext context, PricingListController controller, int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      decoration: BoxDecoration(
          color: Color.fromRGBO(39, 59, 112, 1),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BiaText(controller.pricingFeaturedList[index].subscriptionName, color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600,),
          BiaText(controller.pricingFeaturedList[index].subscriptionAmount.toString(), color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800,),
          BiaText(controller.pricingFeaturedList[index].subscriptionDays.toString(), color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400,),
        ],
      ),
    );
  }
  Widget availablePlanFeatureList(PricingListController controller, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: (15 * 3) + (5 * 3),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (c, i) {
            return Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                  height: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_outline, size: 15,),
                      BiaText("No feature added"),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
  Widget availablePlanViewBottomButtons(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(39, 59, 112, 1),
                  borderRadius: BorderRadius.circular(15)
              ),
              width: 120,
              child: TextButton(
                  onPressed : (){
                    print("buy button tapped at : ${index}");
                  },
                  child: BiaText(
                    LocaleKeys.buy.tr,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(39, 59, 112, 1),
                  borderRadius: BorderRadius.circular(15)
              ),
              width: 120,
              child: TextButton(
                  onPressed : (){
                    print("buy button tapped at : ${index}");
                  },
                  child: BiaText(
                    LocaleKeys.view_more.tr,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}