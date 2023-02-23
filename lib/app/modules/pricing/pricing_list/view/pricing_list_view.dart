import 'package:biapay_app/app/modules/pricing/pricing_list/component/pricing_list_component.dart';
import 'package:biapay_app/app/modules/pricing/pricing_list/controller/pricing_list_controller.dart';
import 'package:biapay_app/app/widgets/export_file.dart';

class PricingListView extends GetView<PricingListController> {

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.pricing_list.tr, isShowFilter: true),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 20.h),
        child: ListView(
          shrinkWrap: true,
          primary: true,
          children: [
            PricingListComponents().titleText(context),
            GetBuilder<PricingListController>(builder: (controller){
              return PricingListComponents().requestedPlanList(controller);
            }),
            GetBuilder<PricingListController>(builder: (controller){
              return PricingListComponents().availablePlanList(context, controller);
            })
          ],
        ),
      ),
    );
  }
}
