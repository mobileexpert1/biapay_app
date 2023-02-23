import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/localization_service.dart';
import 'package:biapay_app/app/models/african_country.dart';
import 'package:biapay_app/app/modules/settings/views/change_language_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class SettingsController extends GetxController {
  late Rx<Language> language;
  final auth = LocalAuthentication();
  final enabledBiometric = false.obs;
  final availableBiometric = false.obs;
  final pushNotifStatus = false.obs;
  final smsStatus = false.obs;
  final emailStatus = false.obs;
  @override
  void onInit() {
    super.onInit();
    final lang = box.read(Config.keys.localLanguage);
    language = Rx<Language>(LocalizationService.langs
        .firstWhere((el) => el.languageCode == lang['lc']));
    checkBiometric();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onChanged(String? lang) {
    language(
        LocalizationService.langs.firstWhere((el) => el.languageCode == lang));
    final country = AfricanCountry.fromJson(box.read(Config.keys.country));
    LocalizationService()
        .changeLocale(Locale(language.value.languageCode, country.code));
  }

  void changeLanguage() => Get.to(() => ChangeLanguageView());

  void checkBiometric() async {
    final r = box.read<bool?>(Config.keys.enabledBiometric) ?? false;
    enabledBiometric(r);
    final canAuthenticate =
        await auth.canCheckBiometrics || await auth.isDeviceSupported();
    availableBiometric(canAuthenticate);
  }

  void changeStatusBiometric(bool value) {
    enabledBiometric(value);
    box.write(Config.keys.enabledBiometric, value);
  }

  void onChangedPushNotificationStatus(bool value) {
    pushNotifStatus(value);
  }

  void onChangedEmailStatus(bool value) {
    emailStatus(value);
  }

  void onChangedSmsStatus(bool value) {
    smsStatus(value);
  }
}
