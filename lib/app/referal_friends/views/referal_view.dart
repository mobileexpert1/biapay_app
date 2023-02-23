import 'package:flutter/cupertino.dart';

import '../../widgets/export_file.dart';
import '../controllers/referal_controller.dart';

class ReferalView extends GetView<ReferalController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar(
          centerTitle: false,
          showAction: false,
          showIcon: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              headingTextWidget(title: LocaleKeys.earn_doller_to_refer.tr),
              SizedBox(
                height: 15.h,
              ),
              howWorksWidget(),
              SizedBox(
                height: 15.h,
              ),
              guideFriendWidget(),
              SizedBox(
                height: 15.h,
              ),
              Divider(color: Colors.white,thickness: 1,),
              SizedBox(
                height: 15.h,
              ),
              headingTextWidget(title: LocaleKeys.share_below_link.tr,fontSize: 26.sp),
              SizedBox(
                height: 15.h,
              ),
              headingTextWidget(title: 'https://backoffice-dev2.biapay.net/referral/324DWEw1',fontSize: 20.sp,fontWeight: FontWeight.normal),

            ],
          ),
        ));
  }

  headingTextWidget({title, fontWeight, fontSize}) {
    return BiaText(
      title ?? "",
      color: Colors.white,
      align: TextAlign.center,
      textType: TextType.headLine6,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: fontSize ?? 30.sp,
      padding: EdgeInsets.zero,
    );
  }

  howWorksWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.keyboard_double_arrow_down,
          size: 50.h,
          color: Colors.white,
        ),
        headingTextWidget(
            title: LocaleKeys.how_it_works.tr,
            fontWeight: FontWeight.normal,
            fontSize: 24.sp),
      ],
    );
  }

  guideFriendWidget() {
    return Row(
      children: [
        Expanded(
            child: headingTextWidget(
                title: LocaleKeys.tell_your_friend.tr,
                fontWeight:  FontWeight.w500,
                fontSize: 16.sp)),

        forwardIconWidget(),
        Expanded(
            child: headingTextWidget(
                title: LocaleKeys.friend_signup.tr,
                fontWeight:  FontWeight.w500,
                fontSize: 16.sp)),
        forwardIconWidget(),
        Expanded(
          child: headingTextWidget(
              title: LocaleKeys.pay_you_both.tr,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp),
        )
      ],
    );
  }
}

forwardIconWidget(){
  return Icon(Icons.arrow_circle_right_rounded,size: 30.w,color: Colors.white,);
}
