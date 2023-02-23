import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/event_controller.dart';

final controller = Get.find<EventController>();

class NewEvent extends StatelessWidget {
  NewEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.add_new_event.tr),
      body: Form(
        key: controller.keyForm,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20.h,
                ),
                eventTitleWidget(),
                eventDescriptionWidget(),
                headingTextWidget(title: LocaleKeys.event_owner.tr),
                ownerDropDownWidget(),
                headingTextWidget(title: LocaleKeys.event_type.tr),
                eventTypeDropDownWidget(),
                headingTextWidget(title: LocaleKeys.event_category.tr),
                eventCategoryDropDownWidget(),
                headingTextWidget(title: LocaleKeys.currency.tr),
                currencyDropDownWidget(),
                SizedBox(
                  height: 20.h,
                ),
                dividerWidget(),
                ticketVariationWidget(),
                eventTierWidget(),
                eventTotalSeatsWidget(),
                eventAvailSeatsWidget(),
                eventPriceWidget(),
                eventDiscountWidget(),
                dividerWidget(),
                organzerWidget(),
                organzerDescriptionWidget(),
                headingTextWidget(title: LocaleKeys.start_date.tr),

                organzerstartDateWidget(),
                headingTextWidget(title: LocaleKeys.end_date.tr),
                organzerEndDateWidget(),
                headingTextWidget(title: LocaleKeys.location_type.tr),
                locationTypeDropDownWidget(),
                SizedBox(
                  height: 20.h,
                ),
                dividerWidget(),

                venuNameWidget(),
                venuLocationWidget(),

                countryNameWidget(),
                stateNameWidget(),
                cityNameWidget(),
                zipCodeWidget(),

                SizedBox(
                  height: 20.h,
                ),
                dividerWidget(),
                SizedBox(
                  height: 20.h,
                ),
                uploadImageWidget(),
                SizedBox(
                  height: 20.h,
                ),
                tagsWidget(),
                saveButtonWidget(),
                SizedBox(
                  height: 50.h,
                ),
              ]),
        ),
      ),
    );
  }


  saveButtonWidget(){
    return   BiaButton.greenButtonInRow(
        width: Get.width,
        margin: EdgeInsets.symmetric(vertical: 30.h,horizontal: 20.w),
        text: LocaleKeys.save_submit.tr, onPressed: () {});
  }

  tagsWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_tags.tr,
      label: LocaleKeys.tags.tr,
    );
  }


  uploadImageWidget(){
    return Padding(
      padding: EdgeInsets.only(left: 12.w,right: 12.w),
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth:2.h,
        radius: Radius.circular(10.h),
        color: Colors.white,
        child: InkWell(
          onTap: controller.pickImage,
          child: Container(
            height: 200.h,
            margin: EdgeInsets.only(left: 10.h,right: 10.h),
            padding: EdgeInsets.only(top: 40.h),
            width: double.infinity,
            decoration: BoxDecoration(
              image: controller.image.value == null
                  ? null
                  : DecorationImage(
                image:
                FileImage(controller.image.value!),
                fit: BoxFit.cover,
              ),
            ),
            child: controller.image.value != null
                ? SizedBox()
                : Column(
              children: [
                const Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                BiaText(
                  LocaleKeys.select_file_to_upload.tr,
                  color: Colors.white,
                  fontSize: 18.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  venuNameWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_venue_name.tr,
      label: LocaleKeys.venue_name.tr,
    );
  }

  venuLocationWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_location_url.tr,
      label: LocaleKeys.location_url.tr,
    );
  }

  countryNameWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_country.tr,
      label: LocaleKeys.country.tr,
    );
  }

  stateNameWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_state.tr,
      label: LocaleKeys.state.tr,
    );
  }

  cityNameWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_city.tr,
      label: LocaleKeys.city.tr,
    );
  }

  zipCodeWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_zip_code.tr,
      label: LocaleKeys.zip_code.tr,
    );
  }



  locationTypeDropDownWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10.w, top: 10.h),
      child: BiaDropdown<String>(
          options: controller.testList,
          showBorder: true,
          outerLabel: false,
          controller: controller.eventTypeController,
          hint: LocaleKeys.select_location_type.tr,
          displayName: (v) => v,
          onSelected: (v) {}),
    );
  }

  organzerstartDateWidget(){
    return Container(
        padding: EdgeInsets.only(left: 15.w, top: 15.h,bottom: 15.h),
        margin: EdgeInsets.only(left: 15.w, top: 10.h,right: 15.w,bottom: 10.h),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white
      ),
      child: Row(
        children: [
          BiaText(
            LocaleKeys.from.tr,
            color: Colors.grey,
            textType: TextType.headLine6,
            fontWeight: FontWeight.w300,
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          Spacer(),
          Icon(Icons.call_to_action_outlined),
          SizedBox(width: 10.w,)
        ],
      )

    );
  }



  organzerEndDateWidget(){
    return Container(
        padding: EdgeInsets.only(left: 15.w, top: 15.h,bottom: 15.h),
        margin: EdgeInsets.only(left: 15.w, top: 10.h,right: 15.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white
        ),
        child: Row(
          children: [
            BiaText(
              LocaleKeys.to.tr,
              color: Colors.grey,
              textType: TextType.headLine6,
              fontWeight: FontWeight.w300,
              padding: EdgeInsets.only(bottom: 5.h),
            ),
            Spacer(),
            Icon(Icons.call_to_action_outlined),
            SizedBox(width: 10.w,)
          ],
        )

    );
  }



  organzerWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_organizer.tr,
      label: LocaleKeys.organizer.tr,
    );
  }

  organzerDescriptionWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_organizer_description.tr,
      label: LocaleKeys.organizer_description.tr,
    );
  }


  dividerWidget() {
    return Divider(
      thickness: 1,
      color: Colors.white,
    );
  }

  eventTierWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_tier.tr,
      label: LocaleKeys.tier.tr,
    );
  }

  eventTotalSeatsWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_total_seats.tr,
      label: LocaleKeys.total_seats.tr,
    );
  }

  eventAvailSeatsWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_available_seats.tr,
      label: LocaleKeys.available_seats.tr,
    );
  }

  eventPriceWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_price.tr,
      label: LocaleKeys.price.tr,
    );
  }

  eventDiscountWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_discount.tr,
      label: LocaleKeys.discount.tr,
    );
  }

  eventTitleWidget() {
    return BiaTextField(
      controller: controller.eventTitleController,
      hint: LocaleKeys.enter_event_title.tr,
      label: LocaleKeys.event_title.tr,
    );
  }

  eventDescriptionWidget() {
    return BiaTextField(
      hint: LocaleKeys.enter_event_description.tr,
      label: LocaleKeys.event_description.tr,
      maxLines: 5,
    );
  }

  headingTextWidget({title}) {
    return BiaText(
      title ?? "",
      color: Colors.white,
      textType: TextType.headLine6,
      fontWeight: FontWeight.w300,
      padding: EdgeInsets.only(left: 15.w, top: 10.h),
    );
  }

  ownerDropDownWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10.w, top: 10.h),
      child: BiaDropdown<String>(
          options: controller.testList,
          showBorder: true,
          outerLabel: false,
          controller: controller.eventOwnerController,
          hint: LocaleKeys.select_event_owner.tr,
          displayName: (v) => v,
          onSelected: (v) {}),
    );
  }

  eventTypeDropDownWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10.w, top: 10.h),
      child: BiaDropdown<String>(
          options: controller.testList,
          showBorder: true,
          outerLabel: false,
          controller: controller.eventTypeController,
          hint: LocaleKeys.select_event_type.tr,
          displayName: (v) => v,
          onSelected: (v) {}),
    );
  }

  eventCategoryDropDownWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10.w, top: 10.h),
      child: BiaDropdown<String>(
          options: controller.testList,
          showBorder: true,
          outerLabel: false,
          controller: controller.eventCategoryController,
          hint: LocaleKeys.select_event_category.tr,
          displayName: (v) => v,
          onSelected: (v) {}),
    );
  }

  currencyDropDownWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10.w, top: 10.h),
      child: BiaDropdown<String>(
          options: controller.testList,
          showBorder: true,
          outerLabel: false,
          controller: controller.currencyController,
          hint: LocaleKeys.select_currency.tr,
          displayName: (v) => v,
          onSelected: (v) {}),
    );
  }

  ticketVariationWidget() {
    return Row(
      children: [
        headingTextWidget(title: LocaleKeys.ticket_variation.tr),
        Container(
          margin: EdgeInsets.only(left: 10.h),
          child: BiaText(
            LocaleKeys.add.tr,
            fontSize: 20.sp,
            color: Colors.white,
          ),
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
          decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(1),
              borderRadius: BorderRadius.circular(10.h)),
        )
      ],
    );
  }
}
