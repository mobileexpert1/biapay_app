// ignore_for_file: constant_identifier_names

import 'package:biapay_app/app/configs/urls.dart';

enum ENVIRONMENTS { TEST, DEV, PRODUCTION }

// ignore: avoid_classes_with_only_static_members
class Environment {
  static const ENVIRONMENTS APP_ENV = ENVIRONMENTS.DEV;

  static String getBaseUrl() {
    String url = URLS.HOST_PRODUCTION_URL;
    if (APP_ENV == ENVIRONMENTS.TEST) {
      url = URLS.HOST_TEST_URL;
    }
    if (APP_ENV == ENVIRONMENTS.DEV) {
      url = URLS.HOST_TEST_URL;
    }
    if (APP_ENV == ENVIRONMENTS.PRODUCTION) {
      url = URLS.HOST_PRODUCTION_URL;
    }
    return url;
  }
}
