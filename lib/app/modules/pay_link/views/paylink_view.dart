import 'package:biapay_app/app/modules/pay_link/views/paylink_component.dart';

import '../../../widgets/export_file.dart';
import '../controllers/paylink_controller.dart';

class PayLinkView extends GetView<PayLinkController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.pay_link.tr,
          isShowFilter: true, filterWidget: popMenuItemWidget(
            onSelectedItem: (selectedIndex){
              if(selectedIndex==1){
                controller.applyFilterOnList(LocaleKeys.all);
              }else  if(selectedIndex==2){
                controller.applyFilterOnList(LocaleKeys.active);
              }else  if(selectedIndex==3){
                controller.applyFilterOnList(LocaleKeys.in_active);
              }
            }
          )),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            serachTextWidget(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                headingTextWidget(title: LocaleKeys.pay_link_list.tr),
                Spacer(),
                selectedStatusItemWidget(),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            GetBuilder<PayLinkController>(builder: (controller) {
              return Expanded(
                child: controller.loading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    :controller.payLinkList?.length==0?emptyListDataWidget() :ListView.builder(
                        itemCount: controller.payLinkList!.value.length ?? 0,
                        controller: controller.scrollController,
                        itemBuilder: (c, i) {
                          return PayLinkComponent(
                              controller.payLinkList!.value[i]);
                        },
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }

  serachTextWidget() {
    return BiaTextField(
      hint: LocaleKeys.search_records.tr,
      label: "",
      padding: EdgeInsets.zero,
      onChanged: (data){
        if(data?.toString().isNotEmpty==true){
          controller.applySerachOnList();
        }else{
          controller.payLinkList?.clear();
          controller.payLinkList?.addAll(controller.mainLinkList??[]);
          controller.update();
        }

      },
      suffixIcon: Icon(Icons.search),
      controller: controller.searchController,
    );
  }

  headingTextWidget({title}) {
    return BiaText(
      title ?? "",
      fontSize: 25.h,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  selectedStatusItemWidget() {
    return PopupMenuButton<int>(
      child: headingTextWidget(title: LocaleKeys.select_status.tr),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 1,
          child: Text(LocaleKeys.status_completed.tr ?? ""),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: Text(LocaleKeys.select_cancelled.tr ?? ""),
        ),
        PopupMenuItem<int>(
          value: 3,
          child: Text(LocaleKeys.active.tr ?? ""),
        )
      ],
      offset: Offset(-10, 10),
      onSelected: (selectedIndex){
        if(selectedIndex==1){
          controller.applyFilterOnList(LocaleKeys.status_completed);
        }else  if(selectedIndex==2){
          controller.applyFilterOnList(LocaleKeys.select_cancelled);
        }else  if(selectedIndex==3){
          controller.applyFilterOnList(LocaleKeys.active);
        }

      },
      color: Colors.white.withOpacity(1),
      elevation: 5,
    );
  }
}
