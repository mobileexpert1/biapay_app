import 'dart:convert';
import 'dart:io';

import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/environment.dart';
import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/configs/toast_controller.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio_logger/dio_logger.dart';


import 'dio_exceptions.dart';

abstract class BaseProvider {
  final dio = Dio();
  Duration timezone = DateTime.now().timeZoneOffset;

  void onInit() {
    final headers = {
     "Accept": "application/json",
      'offset-timezone':
          ((timezone.isNegative ? -1 : 1) * timezone.inHours).toString(),
      "locale": Get.locale?.languageCode
    };

    dio.options = BaseOptions(
        baseUrl: Environment.getBaseUrl(),
        headers: headers,
        sendTimeout: 300000,
        receiveTimeout: 300000,
        connectTimeout: 300000);

    dio.interceptors.add(dioLoggerInterceptor);


    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handle) async {
        var token = box.read(Config.keys.tokenKey);
        if (token != null) {
          // print(user!.toJson());
          if (Get.currentRoute != Routes.SIGNIN &&
              Get.currentRoute != Routes.SIGNUP) {
            if (!isLogin) {
              try {
                final option =
                    BaseOptions(baseUrl: Environment.getBaseUrl(), headers: {
                  "Authorization": "Bearer $token",


                });
                 final refresh = await Dio(option).post('auth/token/refresh');
                token = refresh.data['token'];
                box.write(Config.keys.tokenKey, token);
                print("completed Url is ${ dio.options.baseUrl}");
              } on DioError catch (e) {
                Logger().e(e);
                Get.showtoast(LocaleKeys.session_expired.tr);

                box.remove(Config.keys.tokenKey);
                Get.offAllNamed(Routes.CHOOSE_LOGIN_OPTION);
              }
            }
          }
          options.headers['Authorization'] = "Bearer $token";
        }
        options.headers['language'] = Get.locale!.languageCode;

        return handle.next(options);
      },
      onResponse: (response, handle) {
        if (!(response.data is Map ||
            response.data is List ||
            response.data is String)) {
          response.data = null;
        }
        if (response.data is String) {
          try {
            response.data = json.decode(response.data);
            print("api response ${ response.data}");
          } catch (e) {}
        }
        return handle.next(response);
      },
      onError: (error, handle) {
        print("check exception ${NetworkExceptions.getDioException(error)}");
        //Logger().e(error);
        Get.showtoast(NetworkExceptions.getDioException(error));
        if (error.response != null) {


        }
        return handle.next(error);
      },
    ));
  }

  // void onDispose() {
  //   dio.close();
  //   log("close provider success");
  // }
}




