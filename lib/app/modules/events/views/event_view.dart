

import '../../../widgets/export_file.dart';
import '../controllers/event_controller.dart';
import 'event_component.dart';

class EventView extends GetView<EventController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.event.tr,
          isShowFilter: true, filterWidget: popMenuItemWidget()),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70.h,
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.4.h, color: Colors.white),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(
                    LocaleKeys.search_records.tr,
                    color: Colors.white,
                    fontSize: 20.h,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 80.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(
                    LocaleKeys.event_list.tr,
                    fontSize: 25.h,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  TextButton(
                      onPressed: controller.newEvents,
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
                            LocaleKeys.add_new_event.tr,
                            fontSize: 22.h,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )
                        ],
                      )),
                ],
              ),
            ),
            Expanded(
                  child: /*controller.loading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      :*/ ListView.builder(
                          itemCount: 5,
                          itemBuilder: (c, i) {
                             return EventComponent();
                          },
                        ),
                ),
          ],
        ),
      ),
    );
  }


}
