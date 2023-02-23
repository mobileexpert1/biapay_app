import 'package:biapay_app/app/modules/choose_language/controllers/choose_language_controller.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterCountryDialog extends StatelessWidget {
  const FilterCountryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChooseLanguageController>();
    return AlertDialog(
      title: Text(
        LocaleKeys.intro_home_screen_field_country.tr,
        style: const TextStyle(fontFamily: 'Arial'),
      ),
      content: Obx(() {
        return SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                    labelText: LocaleKeys.search.tr,
                  ),
                  onChanged: (value) {
                    controller.filterCountries(value);
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: controller.filteredCountries.length,
                      itemBuilder: (context, index) {
                        final country = controller.filteredCountries[index];
                        return InkWell(
                          onTap: () => controller.selectCountry(country),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        controller.getImageFromBase64String(
                                            controller
                                                .filteredCountries[index].flag),
                                        Expanded(
                                          child: Text(
                                            controller
                                                .filteredCountries[index].name,
                                            style: const TextStyle(
                                                fontFamily: 'Arial'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (controller.selectedCountry?.value.name ==
                                      controller.filteredCountries[index].name)
                                    Icon(
                                      Icons.done,
                                      size: 20.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                ]),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                            color: Colors.black,
                          )),
                ),
              ],
            ));
      }),
      actions: <Widget>[
        TextButton(
          child: Text('cancel_dialog'.tr,
              style: TextStyle(color: Theme.of(context).primaryColor)),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
