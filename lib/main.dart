import 'dart:io';

import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/localization_service.dart';
import 'package:biapay_app/app/configs/theme.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:oktoast/oktoast.dart';

import 'app/models/providers/user_provider.dart';
final userProvider = UserProvider();

void main() async {
  await initializeDateFormatting();
  HttpOverrides.global = MyHttpOverrides();
  userProvider.onInit();

  await GetStorage.init();
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations(  [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
          designSize: const Size(490.9, 1036.4),
          builder: (context,child) {
            return GetMaterialApp(
              navigatorKey: NavigationService.navigatorKey,
              locale: LocalizationService.locale,
              fallbackLocale: LocalizationService.fallbackLocale,
              translationsKeys: AppTranslation.translations,
              debugShowCheckedModeBanner: false,
              title: Config.appName,
              theme: AppTheme.data,
              initialRoute: initialRoute,
              getPages: AppPages.routes,
            );
          }),
    );
  }
}


class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
//