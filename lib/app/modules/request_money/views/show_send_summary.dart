import '../../../widgets/export_file.dart';
import '../controllers/request_money_controller.dart';

class ShowSendSummaryView extends GetView<RequestMoneyController> {

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<RequestMoneyController>();
    return BiaScaffold(
      appBar:  BiaAppBar.simple(LocaleKeys.show_summary.tr),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h,),
          headingTextWidget(title: LocaleKeys.sending_to_money.tr),
          summaryDetailWidget(),
          sendButtonWidget()
        ],
      ),
    );
  }


  headingTextWidget({title}) {
    return BiaText(
      title ?? "",
      color: Colors.white,
       fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      padding: EdgeInsets.only(left: 4.w, top: 10.h,bottom: 15.h),
    );
  }

  summaryDetailWidget(){
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      padding: EdgeInsets.all(15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white
      ),
      child: Column(
        children: [
          summaryItemWidget(firstTxt: LocaleKeys.email.tr+" :"),
          SizedBox(height: 2.h,),
          summaryItemWidget(firstTxt: LocaleKeys.payment_method.tr+" :"),
          SizedBox(height: 2.h,),
          summaryItemWidget(firstTxt: LocaleKeys.amount.tr+" :"),
          SizedBox(height: 2.h,),
          summaryItemWidget(firstTxt: LocaleKeys.fee.tr+" :"),

          SizedBox(height: 2.h,),
          summaryItemWidget(firstTxt: LocaleKeys.currency.tr+" :"),
          SizedBox(height: 2.h,),
          summaryItemWidget(firstTxt: LocaleKeys.notes.tr+" :"),

          SizedBox(height: 2.h,),
          summaryItemWidget(firstTxt: LocaleKeys.total.tr+" :"),

        ],
      ),


    );
  }



  summaryItemWidget({firstTxt,secTxt}){
    return Row(
      children: [
        Expanded(child: BiaText(firstTxt??"",fontSize: 22.sp,fontWeight: FontWeight.w700,)),
        Expanded(child: BiaText(secTxt??"",fontSize: 21.sp,fontWeight: FontWeight.normal,)),
      ],
    );
  }


  sendButtonWidget(){
    return BiaButton.greenButtonInRow(
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal:10.w),
        text: LocaleKeys.send_money.tr, onPressed: (){

           });
  }


}