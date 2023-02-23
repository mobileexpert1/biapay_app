import 'package:biapay_app/app/modules/ticket/controllers/ticket_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/new_ticket_controller.dart';

class NewTiket extends StatelessWidget {
  const NewTiket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewTicketController>();
    return BiaScaffold(
      appBar: BiaAppBar.simple(Get.arguments == null
          ? LocaleKeys.add_new_tiket.tr
          : LocaleKeys.edit_ticket.tr),
      body: Form(
        key: controller.keyForm,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 20.h,
              ),
              BiaTextField(
                controller: controller.titleController,
                onChanged: (e) => controller.ticket.title = e,
                hint: LocaleKeys.enter_title.tr,
                label: LocaleKeys.title.tr,
              ),
              BiaTextField(
                controller: controller.msgController,
                onChanged: (e) => controller.ticket.content = e,
                hint: LocaleKeys.enter_message.tr,
                label: LocaleKeys.message.tr,
                maxLines: 5,
              ),
              SizedBox(
                height: 10.h,
              ),
              GetBuilder<NewTicketController>(builder: (controller) {
                return BiaDropdown<String>(
                  options: controller.priorities,
                  margin: EdgeInsets.only(left: 20.h, right: 20.h),
                  controller: controller.priorityController,
                  hint: LocaleKeys.priority.tr,
                  displayName: (v) => v,
                  onSelected: (v) => controller.ticket.priority = v,
                );
              }),
              Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BiaText(
                      LocaleKeys.upload_image.tr,
                      fontSize: 20.h,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                   GetBuilder<NewTicketController>(builder: (controller){return  DottedBorder(
                     borderType: BorderType.RRect,
                     strokeWidth: 1.8.h,
                     radius: Radius.circular(10.h),
                     color: Colors.white,
                     child: InkWell(
                       onTap: controller.pickImage,
                       child: Container(
                         height: 200.h,
                         padding: EdgeInsets.only(top: 40.h),
                         width: double.infinity,
                         decoration: BoxDecoration(
                           image: controller.uint8list != null
                               ? DecorationImage(
                             image:
                             MemoryImage(controller.uint8list!),
                             fit: BoxFit.cover,
                           )
                               : controller.image.value == null
                               ? null
                               : DecorationImage(
                             image: FileImage(
                                 controller.image.value!),
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
                   );})
                  ],
                ),
              ),

              SizedBox(
                height: 25.h,
              ),
              // controller.priorities
              BiaButton(
                text: LocaleKeys.save_submit.tr,
                onPressed: (){
                  if(Get.arguments==null){
                    controller.validateTextFields();
                  }else{
                    controller.validateUpdatedTextFields();
                  }
                },
                color: Colors.lightGreen,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
