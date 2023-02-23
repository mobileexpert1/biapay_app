import 'dart:convert';

import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/localization_service.dart';
import 'package:biapay_app/app/models/african_country.dart';
import 'package:biapay_app/app/modules/choose_language/views/filter_country_dialog.dart';
import 'package:biapay_app/app/modules/choose_language/views/language_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChooseLanguageController extends GetxController {
  //TODO: Implement ChooseLanguageController

  RxList<AfricanCountry> countries = <AfricanCountry>[].obs;
  RxMap<String, String> selectedLanguage = <String, String>{}.obs;
  late Rx<Language> currentLocale;
  LocalizationService localizationService = LocalizationService();
  RxList<AfricanCountry> filteredCountries = <AfricanCountry>[].obs;
  Rx<AfricanCountry>? selectedCountry;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    initLocalization();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Widget getImageFromBase64String(String? base64String) {
    final base64 = Base64Codec();
    if (base64String == null) return Container();
    final bytes = base64.decode(base64String);
    return CircleAvatar(
      // radius: 40.0,
      backgroundColor: Colors.transparent,
      // radius: 40.0,
      child: Image.memory(
        bytes,
        // width: 45,
        // height: 45,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  // RxList<Map<String, String>> languages = [
  //   {
  //     "name": "English",
  //     "lang_code": "en",
  //     "country_code": "US",
  //     "base64Flag":
  //         "iVBORw0KGgoAAAANSUhEUgAAAB4AAAAUCAYAAACaq43EAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpBMjExNEYyMDE3OEExMUUyQTcxNDlDNEFCRkNENzc2NiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpBMjExNEYyMTE3OEExMUUyQTcxNDlDNEFCRkNENzc2NiI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkEyMTE0RjFFMTc4QTExRTJBNzE0OUM0QUJGQ0Q3NzY2IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkEyMTE0RjFGMTc4QTExRTJBNzE0OUM0QUJGQ0Q3NzY2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+EXnauAAABW1JREFUeNrEVm1QVGUUfu7dXZBYvuRj1yATNT5FxCClTNLUFNBJrfxRZjOKkVLqGA2okGGDhA44ToqT1pigA9qAhkho4kiCqRhgCKwBg5IiLCDs8rEid0/vvVfWGD/K/nR27u7Ofc85z/Oe9znnXi52S4Eh49sy9DS1AE6OgJsdYDYDhOFWr8fi+Ej8kByBuoDX0FOtA6dUwVrrignNlxG1vQT7Yg8B492Gx3HsUvBAmxHoNEAdFoyYqDAoUzeF2322djbS0k9h53el6NXdAEY6Aa6PIfBvTQTkGaBeBOxmgCFYFz0Dy5z0GJe7FbzxdAlc1CokJ4SjoSoRsQkLoXawAXTNLKhHZss9JaAY085idbdgN9EbcQfWo2JTIJLOpoCbOw0VR8+BvzUrDFe8X4Th5Blo7K2RmjQfjZWJiE9aBHtnW5lAe69IH9wTCMhrDLCD+epuwiHIFwmHGGCcH5LPpYCfHYrKY2VwPJyHoNYGoKXwNAlvRVItK2qVTzAZi0toyNqNAxT7eT6px2xkBQ+nsI+OSPdrJ4TRJWipXPkc/e4xWbq3OKGI+USSOmwPxX1fQ01nLhB9+AHVs7y/uXpSR3auJa+JXYB/Gi1LKaXiXTlUExRKvzDHinGB1L430+LYqjfS8k8yacmmEyQMCg8BCwN3KSqthN5dtZ+u7s4iYekS+kPMM8qL2nPyLHkq6jto6apDBJuPCVOXHSSvyH0UnVVPOrbYf7Gc6uYtpLqIt6kzt4AeZdV+IrCGyhUeVOkeRGbpw6zpGvVGR1PtjHl0p/DnYTFX20y08ouT5D13D730/kHiSNo2s/4+GE1m2DmpLec2qO8Ap1KxtlGAFwWj4iEYTagJjcTdaw1SOyldRsL31+Ow0joDBna+Ls6WeBIEUL9J+t9nuge1rTVgYyNromb8VBqSI+MNQSBwCgXTCSe3khhMw3vK3Nsnt9p9VfG2z7Af5q9UyqoW/QeFYZ2oUDA/jsdQfyp7G5ufukWVjg7si5dzMJB7f7Y8RO6fjMf/ZEqbMR4PGpGxFszDmXPi9JGalKTyihuTSi08KLXKYxT+3uTc0NSCnJNYHM+OjruPIflYxMUSm7qMsGJCkhZUSnDW1g8YiGAsl8BEUsvEZRoSlysTV1k+E5eLRMZsloFEwrza1hJ+19gHazsrca/yjhfFF+B2UycCfLWIWfkqArQjLM791XW4uXUbnNlIdYpbC3j6QGEjKYXxNMsCEzU1ij0YrKyGnV33ybPQ7z8gbg2jN3wKvb8f0nOv43xeKVw1avB5KbkYYerFmzPHW0CNpRdRHTwDTQG+eL6tAb0+gVifcRkrvipmIjdLupIQWekUolJZ0dZ8XYaYuBx0G+X2cZg1BXYhITCeKcWlCf4whM7E67fK4f6CB37MY3OyubXH0uTGkjK6Mmka1bBUg/PfoJajJyg9V0djlxxmx7GQQpdnP3ZkLogvZD7zyNk7kRKTC6mzX7Dk7TpeRJWeE6VpZn7vHbp+oph4Dzdb9F24jOrJ03F9+svwfXYE3PILsSc6A1Myu7Bu0Q405rNBCi3cNXaPValGfKBgDDpuG5C04TDGTtyML7efgmGA4BAxB4GNVXA5Voiqs9Uwhc8ELwI2TQ2G32hbaAqKsGvFboRkGRATsQ03fjoPeLkC7k6S+J7Uq/IaO3M3e8B7NLraepAQmw3PgM1gFUD3gBmOC+Zi0o2r0OQXQemjscKd3HxkWPkjPfMSGrLT2FhTyYBSrqd8ExAJsOknvclo7NHZasCWjUew+8AFrF3xCtasmQ2HyDlQ7lr9jXFnVjkac1IZIJO6l9t/A3wUAbpPQGuPjpZuqQI79p7D6qhp+EuAAQB9e+n65ZcRTgAAAABJRU5ErkJggg=="
  //   },
  //   {
  //     "name": "Français",
  //     "lang_code": "fr",
  //     "country_code": "FR",
  //     "base64Flag":
  //         "iVBORw0KGgoAAAANSUhEUgAAAB4AAAAUCAIAAAAVyRqTAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpBMjUyMkUxODE3NzkxMUUyODY3Q0FBOTFCQzlGNjlDRiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpDQjc4RjdFMDE3NzkxMUUyODY3Q0FBOTFCQzlGNjlDRiI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkEyNTIyRTE2MTc3OTExRTI4NjdDQUE5MUJDOUY2OUNGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkEyNTIyRTE3MTc3OTExRTI4NjdDQUE5MUJDOUY2OUNGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+NYcTvAAAADBJREFUeNpiZFCYz4Ab/L+fgEf2q7YTHlkmBpqBUaNHjR41etToUaNHjaad0QABBgAMOgSHJZqdhAAAAABJRU5ErkJggg=="
  //   },
  // ].obs;

  void initLocalization() async {
    currentLocale = Rx<Language>(LocalizationService.currentLocale);
    // update();
    final africanCountriesList = await loadAfricanCountries();
    countries.assignAll(africanCountriesList);

    Future.delayed(const Duration(microseconds: 500), () {
      localizationService.changeLocale(LocalizationService.locales.firstWhere(
          (el) => currentLocale.value.languageCode == el.languageCode));
    });
    final country = box.read(Config.keys.country);
    if (country != null) {
      selectedCountry = Rx<AfricanCountry>(AfricanCountry.fromJson(country));
    } else {
      selectedCountry = Rx<AfricanCountry>(countries.first);
    }
    box.write(Config.keys.country, selectedCountry!.value.toJson());
  }

  void changeLocale(Locale lang) {
    localizationService.changeLocale(lang);
    currentLocale.value = LocalizationService.currentLocale;
    // update();
  }

  Future<List<AfricanCountry>> loadAfricanCountries() async {
    final jsonResponse =
        await rootBundle.loadString('assets/data/african_countries.json');
    return africanCountryFromJson(jsonResponse);
  }

  void filterCountries(value) {
    final results = countries.where((country) {
      return country.name
              .toLowerCase()
              .contains(value.toString().toLowerCase()) ||
          country.dialCode
              .toLowerCase()
              .contains(value.toString().toLowerCase());
    }).toList();
    filteredCountries.assignAll(results);
  }

  void showCountries() {
    filteredCountries.assignAll(countries);
    Get.dialog(FilterCountryDialog(), barrierDismissible: false);
  }

  void showLanguages() {
    Get.dialog(LanguageDialog(), barrierDismissible: false);
  }

  void selectCountry(AfricanCountry country) {
    selectedCountry?.call(AfricanCountry.fromJson(country.toJson()));
    box.write(Config.keys.country, country.toJson());
    Get.back();
  }

  void selectLanguage(Language lang) {
    final locale = LocalizationService.locales
        .firstWhere((el) => el.languageCode == lang.languageCode);
    changeLocale(locale);
    Get.back();
  }
}
