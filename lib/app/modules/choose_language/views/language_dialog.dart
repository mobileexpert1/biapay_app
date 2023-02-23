import 'package:biapay_app/app/configs/localization_service.dart';
import 'package:biapay_app/app/modules/choose_language/controllers/choose_language_controller.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChooseLanguageController>();
    return AlertDialog(
      title: Text(
        LocaleKeys.choose_language.tr,
        style: const TextStyle(fontFamily: 'Arial'),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: LocalizationService.langs.length,
            itemBuilder: (context, index) {
              final lang = LocalizationService.langs[index];
              return InkWell(
                onTap: () => controller.selectLanguage(lang),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              lang.name,
                              style: const TextStyle(fontFamily: 'Arial'),
                            ),
                          ],
                        ),
                        if (controller.currentLocale.value.languageCode ==
                            lang.languageCode)
                          Icon(
                            Icons.done,
                            size: 20.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      ]),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.black,
                )),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(LocaleKeys.cancel_dialog.tr,
              style: TextStyle(color: Theme.of(context).primaryColor)),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
