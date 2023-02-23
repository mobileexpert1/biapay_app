import 'dart:io';

import 'package:biapay_app/generated/locales.g.dart';
import 'package:dio/dio.dart';

class NetworkExceptions{


static  String getDioException(error) {
    String? message;
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
            //  message=LocaleKeys.ca
              break;
            case DioErrorType.connectTimeout:
              message = LocaleKeys.send_timeout;
              break;

              break;
            case DioErrorType.receiveTimeout:
              message = LocaleKeys.receive_timeout;
              break;
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 400:
                case 401:
                case 403:
                  message = LocaleKeys.unauthorised_request;
                  break;
                case 404:
                  message = LocaleKeys.nott_found;
                  break;
                case 409:
                  message = LocaleKeys.conflict;
                  break;
                case 408:
                  message = LocaleKeys.request_cancelled;
                  break;
                case 500:
                  message = LocaleKeys.internal_serverError;
                  break;
                case 503:
                  message = LocaleKeys.service_unavailable;
                  break;
                default:
                  message=error.message;
              }
              break;
            case DioErrorType.sendTimeout:
              message = LocaleKeys.send_timeout;
              break;
          }
        } else if (error is SocketException) {
          message = LocaleKeys.no_internet_connection;
        } else {
          message = LocaleKeys.unexpected_error;
        }
        return message!;
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        return LocaleKeys.format_exception;;
      } catch (_) {
        return LocaleKeys.unexpected_error;
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return LocaleKeys.unable_process;
      } else {
        return LocaleKeys.unexpected_error;
      }
    }
  }
}
