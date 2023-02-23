import '../../../widgets/export_file.dart';
import '../../../widgets/ticket_component.dart';
import '../controllers/ticket_controller.dart';

class TicketView extends StatelessWidget {
  var controller = Get.put(TicketController());

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.tikets.tr,
          isShowFilter: true, filterWidget: popMenuItemWidget()),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            serachTextWidget(),
            SizedBox(
              width: double.infinity,
              height: 80.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(
                    LocaleKeys.ticket_list.tr,
                    fontSize: 25.h,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  TextButton(
                      onPressed: controller.newTicket,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 35.h,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          BiaText(
                            LocaleKeys.add_new_tiket.tr,
                            fontSize: 22.h,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )
                        ],
                      )),
                ],
              ),
            ),
            GetBuilder<TicketController>(builder: (controller) {
              return Expanded(
                child: controller.loading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    : ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.tickets!.value.length,
                        itemBuilder: (c, i) {
                           return TicketComponent(ticket: controller.tickets![i]);
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
      onChanged: (data) {
        if (data?.toString().isNotEmpty == true) {
          controller.applySerachOnList();
        } else {
          controller.tickets?.clear();
          controller.tickets?.addAll(controller.mainTicketList ?? []);
          controller.update();
        }
      },
      suffixIcon: Icon(Icons.search),
      controller: controller.searchController,
    );
  }

  popMenuItemWidget({Function(int)? onSelectedItem}) {
    return PopupMenuButton<int>(
      icon: Padding(
        padding: EdgeInsets.only(right: 20.w),
        child: Icon(
          Icons.filter_alt,
          color: Colors.grey,
          size: 45.h,
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 1,
          // row has two child icon and text.
          child: Text(LocaleKeys.all.tr ?? ""),
        ),
        PopupMenuItem<int>(
          value: 2,
          // row has two child icon and text.
          child: Text(LocaleKeys.active.tr ?? ""),
        ),
        PopupMenuItem<int>(
          value: 3,
          // row has two child icon and text.
          child: Text(LocaleKeys.in_active.tr ?? ""),
        )
      ],
      offset: Offset(-10, 10),
      color: Colors.white.withOpacity(1),
      onSelected: (selectedIndex) {
        if (onSelectedItem != null) {
          onSelectedItem(selectedIndex);
        }
      },
      elevation: 5,
    );
  }
}
