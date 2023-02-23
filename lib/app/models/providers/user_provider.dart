import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/models/kyc_model.dart';
import 'package:biapay_app/app/models/merchent_shop_model.dart';
import 'package:biapay_app/app/models/providers/base_provider.dart';
import 'package:biapay_app/app/models/providers/user_summary_model.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../configs/environment.dart';
import '../POSModel.dart';
import '../country_state_model.dart';
import '../coupon_model.dart';
import '../currency_model.dart';
import '../customer_model.dart';
import '../dashboard_amount_shop_collection.dart';
import '../dashboard_pie_chart.dart';
import '../invoice_model.dart';
import '../merchant_generate_pay.dart';
import '../merchant_summary_model.dart';
import '../merchent_profile_model.dart';
import '../merchent_subscription_model.dart';
import '../payink_model.dart';
import '../pricing_featured_model.dart';
import '../pricing_model.dart';
import '../product_model.dart';
import '../recovery_model.dart';
import '../security_question.dart';
import '../shop_model.dart';
import '../sucees_model.dart';
import '../ticket_data_model.dart';
import '../ticket_model.dart';
import 'access_history_model.dart';
import 'constants.dart';
import 'dio_exceptions.dart';

class UserProvider extends BaseProvider {
  var invoice_base = "https://invoice-dev.biapay.net/";
  var back_office_base = "https://backoffice-dev.biapay.net/api/";

  Future loginApicall({data}) async {
    try {
      var response = await dio.post(LOGIN_URL, data: jsonEncode(data));

      if (response != null && response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future registerPrivateUser({phoneNumber}) async {
    try {
      var response = await dio.get(REGISTER_PRIVATE_URL, queryParameters: {
        'userType': box.read(Config.keys.userType),
        "phone": phoneNumber
      });
      if (response != null && response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future recoveryQuestionUser({data}) async {
    try {
      var response = await dio.post(RECOVER_QUESTIONS, data: jsonEncode(data));
      if (response != null && response.statusCode == 200)
        return RecoveryModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future generateOtpForUser({data}) async {
    try {
      var response = await dio.post(GENERATE_OTP, data: jsonEncode(data));
      if (response != null && response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future validateOtpForUser({data}) async {
    try {
      var response = await dio.post(OTP_VALIDATE, data: jsonEncode(data));
      if (response != null && response.statusCode == 200) return response.data;
    } catch (error) {
      Get.showtoast(NetworkExceptions.getDioException(error));
    }
  }

  Future getPublicQuestions() async {
    try {
      var response = await dio.get(
        SECURITY_QUESTIONS,
      );
      if (response != null && response.statusCode == 200)
        return (response.data as List)
            .map((p) => SecurityModel.fromJson(p))
            .toList();
    } catch (error) {
      Get.showtoast(NetworkExceptions.getDioException(error));
      //  Get.showtoast(e?.toString());
    }
  }

  Future privateUserCompleteRegister(endPoint, {data}) async {
    try {
      var response = await dio.post(endPoint, data: jsonEncode(data));
      if (response != null && response.statusCode == 200)
        return SuccessModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future forgotPasswordRecovery({email, userType}) async {
    try {
      var response = await dio.get(VALID_USER_REGISTERED,
          queryParameters: {'email': email, 'userType': userType});
      if (response != null && response.statusCode == 200)
        return (response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future sendRecoverOtpByQues({data}) async {
    try {
      var response = await dio.post(QUESTIONS_SEND, data: jsonEncode(data));
      if (response != null && response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future recoverOtpForUser({data}) async {
    try {
      var response = await dio.post(RECOVER_OTP, data: jsonEncode(data));
      if (response != null && response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future uploadImageOnServer({fileImge}) async {
    try {
      var response = await dio.post(UPLOAD_USER_PRFOFILE,
          data: FormData.fromMap({
            "image": await MultipartFile.fromFile(fileImge,
                filename: File(fileImge).path)
          }));
      if (response != null && response.statusCode == 200)
        return SuccessModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future uploadMerchentImageOnServer({fileImge}) async {
    try {
      var response = await dio.post(UPLOAD_MERCHENT_PRFOFILE,
          data: FormData.fromMap({
            "image": await MultipartFile.fromFile(fileImge,
                filename: File(fileImge).path)
          }));
      if (response != null && response.statusCode == 200)
        return SuccessModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getUserUploadImageFromServer({Url}) async {
    try {
      var response = await Dio().get(
        Url,
        options: Options(responseType: ResponseType.bytes, headers: {
          "Authorization": "Bearer ${box.read(Config.keys.tokenKey)}",
        }),
      );

      if (response != null && response.statusCode == 200)
        return (response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getTicketImage({endPointUrl, udid}) async {
    try {
      var response = await Dio().get(
        endPointUrl + "${udid}",
        options: Options(responseType: ResponseType.bytes, headers: {
          "Authorization": "Bearer ${box.read(Config.keys.tokenKey)}",
        }),
      );

      if (response != null && response.statusCode == 200)
        return (response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getCustomerProfileFromServer() async {
    try {
      var response = await dio.get(CUSTOMER_PROFILE);
      if (response != null && response.statusCode == 200)
        return SuccessModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future merchentProfileFromServer() async {
    try {
      var response = await dio.get(MERCHENT_PROFILE);
      if (response != null && response.statusCode == 200)
        return MerchentProfile.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getCustomerQrCode({endPointUrl, udid}) async {
    try {
      var response = await Dio().get(
        endPointUrl + "${udid}",
        options: Options(responseType: ResponseType.bytes, headers: {
          "Authorization": "Bearer ${box.read(Config.keys.tokenKey)}",
        }),
      );

      if (response != null && response.statusCode == 200)
        return (response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getCustomerBarCodeCode({endPointUrl, udid}) async {
    try {
      var response = await Dio().get(
        endPointUrl + "${udid}",
        options: Options(responseType: ResponseType.bytes, headers: {
          "Authorization": "Bearer ${box.read(Config.keys.tokenKey)}",
        }),
      );

      if (response != null && response.statusCode == 200)
        return (response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future updateTicket({ticketId, data}) async {
    try {
      var response =
          await dio.put(UPLOAD_TICKET + "/${ticketId}", data: jsonEncode(data));
      if (response != null && response.statusCode == 200)
        return Ticket.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future uploadTicket(requestModel) async {
    try {
      var response = await dio.post(UPLOAD_TICKET, data: (requestModel));
      if (response != null && response.statusCode == 200)
        return Ticket.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future uploadTicketImage(File? doc) async {
    try {
      var response = await dio.post(UPLOAD_TICKET_IMAGE,
          data: FormData.fromMap({
            "document":
                await MultipartFile.fromFile(doc!.path, filename: doc!.path),
            "type": 'TICKET',
          }));
      if (response != null && response.statusCode == 200)
        return TicketDataModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future passwordConfirmationUser({data}) async {
    try {
      var response =
          await dio.post(CHANGE_PASSWORD_RECOVER, data: jsonEncode(data));
      if (response != null && response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future changePasswordNormal({data}) async {
    try {
      var response = await dio.post(CHANGE_PASSWORD, data: jsonEncode(data));
      if (response != null && response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future saveKycForUser(Kyc kyc, String endPoint) async {
    try {
      var response = await dio.post(endPoint,
          data: FormData.fromMap({
            "json": json.encode(
              kyc.toJson()
                ..remove('uploadproof')
                ..remove('addressproof')
                ..remove('addressproof_path')
                ..remove('uploadproof_path')
                ..remove('uploadProofContentType')
                ..remove('addressProofContentType'),
            ),
            "uploadproof": MultipartFile.fromFileSync(
                kyc.identityInformation!.uploadProofFile.value!.path),
            "addressproof": MultipartFile.fromFileSync(
                kyc.identityInformation!.addressProofFile.value!.path)
          }));
      if (response != null && response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getTransactionListApiCal({fromDate, toDate, currency}) async {
    try {
      var response = await dio.get(TRANSACTION_LIST, queryParameters: {
        'fromDate': fromDate,
        'toDate': toDate,
        'currency': currency
      });
      if (response != null && response.statusCode == 200)
        return (response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future currencyListApiCall() async {
    try {
      var response = await dio.get(CURRENCY_LIST);
      if (response != null && response.statusCode == 200)
        return (response.data as List)
            .map((data) => CurrencyModel.fromJson(data as Map<String, dynamic>))
            .toList();
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future paymentListApiCall() async {
    try {
      var response = await dio.get(PAYMENT_CATEGORIES_URL);
      if (response != null && response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getTicketApiCall({page, size}) async {
    try {
      var response = await dio
          .get("user/ticket", queryParameters: {'page': page, 'size': size});
      if (response != null && response.statusCode == 200)
        return ((response.data as List)
            .map((e) => Ticket.fromJson(e))
            .toList());
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future payLinkListApiCall({page, size}) async {
    try {
      var response = await dio
          .get(USER_PAY_LINK, queryParameters: {'page': page, 'size': size});
      if (response != null && response.statusCode == 200)
        return PalLinkModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getKyc(endPoint) async {
    try {
      var response = await dio.get(
        endPoint,
      );
      if (response != null && response.statusCode == 200)
        return Kyc.fromJson(response.data['userKYC']);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future<void> getPrivateInformation() async {}

  Future<void> getBusinessInformation() async {}

  Future<void> updatePhoneNumber() async {}

  Future<void> updateEmailAddress() async {}

  Future<void> refreshToken() => dio.post("auth/token/refresh").then(
      (response) => box.write(Config.keys.tokenKey, response.data['token']));

  Future<void> signUp() async {}

  Future<void> biometricLogin() async {}

  bool hasToken() {
    final token = box.read(Config.keys.tokenKey);
    if (token != null) {
      return !JwtDecoder.isExpired(token!);
    }
    return false;
  }

  Future<void> savsdeKyc(Kyc kyc) => dio
      .post("user/kyc",
          data: FormData.fromMap({
            "json": json.encode(
              kyc.toJson()
                ..remove('uploadproof')
                ..remove('addressproof')
                ..remove('addressproof_path')
                ..remove('uploadproof_path')
                ..remove('uploadProofContentType')
                ..remove('addressProofContentType'),
            ),
            "uploadproof": MultipartFile.fromFileSync(
                kyc.identityInformation!.uploadProofFile.value!.path),
            "addressproof": MultipartFile.fromFileSync(
                kyc.identityInformation!.addressProofFile.value!.path)
          }))
      .then((response) => print(response.data));

// Future<List<SecurityQuestionResponse>> getSecurityQuestions() async {
//   final Map<String, String> headers = {};
//   headers.putIfAbsent("Content-Type", () => "application/json");
//   headers.putIfAbsent("accept", () => "application/json");
//   apiProvider.headers = headers;
//   final response = await apiProvider.get(
//       Environment.getBaseUrl(), 'admin/security/questions/public');

//   return (json.decode(response.toString()) as List)
//       .map((data) =>
//           SecurityQuestionResponse.fromJson(data as Map<String, dynamic>))
//       .toList();
// }
/*
  {
        'email': emailTextController.text,
        'phoneNo': phoneNumberTextController.text,
        'twoFactorStatus': twoFactorAuthEnabled.value,
        'firstName': firstNameTextController.text,
        'lastName': lastNameTextController.text,
        "password": passwordTextController.text,
        "confirmPassword": confirmPasswordTextController.text,
        // 'gender': genderTextController.text,
        "securityAnswers": [
          {
            'question_id': selectedSecurityQuestion1.value.id,
            "answer": securityQuestion1AnswerTextController.text
          },
          {
            'question_id': selectedSecurityQuestion2.value.id,
            "answer": securityQuestion2AnswerTextController.text
          }
        ]
      }
  */

  Future allShopListApiCall() async {
    try {
      var response = await dio.get(MERCHENT_ALL_SHOPS);
      if (response != null && response.statusCode == 200)
        return MerchentShopModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getAllSubscriptionInformation() async {
    try {
      var response = await dio.get(SUBSCRIPTION_INFORMATION_VIEW);
      if (response != null && response.statusCode == 200)
        return MerchentSubscriptionModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getDashboardAmountBasedOnShop({url}) async {
    try {
      var response = await dio.get(url);
      if (response != null && response.statusCode == 200)
        return AmountShopCollectionModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getDashBoardSummaryApi() async {
    try {
      var response = await dio.get(MERCHENT_DASHBOARD_SUMMARY_API);
      if (response != null && response.statusCode == 200)
        return DashBoardSummaryModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getUserDashBoardSummaryApi() async {
    try {
      var response = await dio.get(USER_DASHBOARD_SUMMARY_API);
      if (response != null && response.statusCode == 200)
        return UserDashBoardSummaryModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }





  Future getMerchantpayLinkList({page, size}) async {
    try {
      var response = await dio.get(MERCHANT_PAY_LINK,
          queryParameters: {'page': page, 'size': size});
      if (response != null && response.statusCode == 200)
        return GeneratePayLinkModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  /*handle method for add as well as for update*/
  Future generateMerchantPayLink({data, isAdded}) async {
    try {
      var response;
      if (isAdded == true) {
        response = await dio.post(MERCHANT_PAY_LINK, data: jsonEncode(data));
      } else {
        response = await dio.put(MERCHANT_PAY_LINK, data: jsonEncode(data));
      }

      if (response != null && response.statusCode == 200)
        return GeneratePayLinkDataModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future generateMerchantBulkPayLink({data}) async {
    try {
      var response = await dio.post(MERCHANT_BULK_PAY_LINK, data: data);
      if (response != null && response.statusCode == 200)
        return (response.data as List)
            .map((data) =>
                GeneratePayLinkDataModel.fromJson(data as Map<String, dynamic>))
            .toList();
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future getDashboardPieChartOnShop({url}) async {
    try {
      var response = await dio.get(url);
      if (response != null && response.statusCode == 200)
        return DashBoardPieModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  // new edit
  Future countryListApiCall() async {
    try {
      dio.options = BaseOptions(
          baseUrl: "https://countriesnow.space/api/v0.1/countries/");
      var response = await dio.get(STATE_LIST);
      print("countryListApiCall------- > " + dio.options.baseUrl + STATE_LIST);
      if (response != null && response.statusCode == 200)
        return CountryStateModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future customerListApiCall() async {
    try {
      dio.options = BaseOptions(baseUrl: invoice_base);
      var response = await dio.get(CUSTOMER_LIST);
      print("customerListApiCall------- > " + dio.options.baseUrl);
      if (response != null && response.statusCode == 200)
        return (response.data as List)
            .map((data) => CustomerModel.fromJson(data as Map<String, dynamic>))
            .toList();
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future productListApiCall() async {
    try {
      dio.options = BaseOptions(baseUrl: invoice_base);
      var response = await dio.get(PRODUCT_LIST);
      print("productListApiCall------- > " + dio.options.baseUrl);
      if (response != null && response.statusCode == 200)
        return (response.data as List)
            .map((data) => ProductModel.fromJson(data as Map<String, dynamic>))
            .toList();
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future couponListApiCall() async {
    try {
      dio.options = BaseOptions(baseUrl: invoice_base);
      var response = await dio.get(COUPON_LIST);
      print("couponListApiCall------- > " + dio.options.baseUrl + COUPON_LIST);
      if (response != null && response.statusCode == 200)
        return (response.data as List)
            .map((data) => CouponModel.fromJson(data as Map<String, dynamic>))
            .toList();
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future invoiceListApiCall() async {
    try {
      dio.options = BaseOptions(baseUrl: invoice_base);
      var response = await dio.get(CREATE_INVOICE);
      print("invoiceListApiCall------- > " +
          dio.options.baseUrl +
          CREATE_INVOICE);
      if (response != null && response.statusCode == 200)
        return (response.data as List)
            .map((data) => InvoiceModel.fromJson(data as Map<String, dynamic>))
            .toList();
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future POSListApiCall(String shopIdForPOS) async {
    try {
      dio.options = BaseOptions(baseUrl: back_office_base);
      var response = await dio.get(POS_LIST + shopIdForPOS);
      print("POSListApiCall------- > " +
          dio.options.baseUrl +
          "/${POS_LIST}/${shopIdForPOS}");
      if (response.statusCode == 200) return PosModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future shopListApiCall() async {
    try {
      dio.options = BaseOptions(baseUrl: back_office_base);
      var response = await dio.get(SHOPS_LIST);
      print("shopListApiCall------- > " + dio.options.baseUrl);
      if (response != null && response.statusCode == 200)
        return ShopModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future createInvoice({data}) async {
    try {
      dio.options = BaseOptions(baseUrl: back_office_base);
      print("createInvoice url ---------> " + dio.options.baseUrl);
      var response = await dio.post(CREATE_INVOICE, data: jsonEncode(data));
      if (response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future createProduct({data}) async {
    try {
      dio.options = BaseOptions(baseUrl: invoice_base);
      print(
          "createProduct url ---------> " + dio.options.baseUrl + PRODUCT_LIST);
      var response = await dio.post(PRODUCT_LIST, data: jsonEncode(data));
      if (response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future createCustomer({data}) async {
    try {
      dio.options = BaseOptions(baseUrl: invoice_base);
      print("createInvoice url ---------> " +
          dio.options.baseUrl +
          CUSTOMER_LIST);
      var response = await dio.post(CUSTOMER_LIST, data: jsonEncode(data));
      if (response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future createCoupon({data}) async {
    try {
      dio.options = BaseOptions(baseUrl: invoice_base);
      print("createCoupon url ---------> " + dio.options.baseUrl + COUPON_LIST);
      var response = await dio.post(COUPON_LIST, data: jsonEncode(data));
      if (response.statusCode == 200) return response.data;
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future pricingListApiCall() async {
    try {
      dio.options = BaseOptions(baseUrl: back_office_base);
      var response = await dio.get(PRICING_LIST);
      print("pricingListApiCall------- > " + dio.options.baseUrl);
      if (response != null && response.statusCode == 200)
        return PricingModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future lastLoginApiCall() async {
    try {
      dio.options = BaseOptions(baseUrl: back_office_base);
      var response = await dio.get(LAST_LOGIN_API);
      print("LastLoginApiCall------- > " + dio.options.baseUrl);
      if (response != null && response.statusCode == 200)
        return AccessHistoryModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }

  Future pricingFeaturedListApiCall() async {
    try {
      dio.options = BaseOptions(baseUrl: back_office_base);
      var response = await dio.get(PRICING_FEATURED_LIST);
      print("pricingFeaturedListApiCall------- > " + dio.options.baseUrl);
      if (response != null && response.statusCode == 200)
        return PricingFeaturedModel.fromJson(response.data);
    } catch (e) {
      Get.showtoast(NetworkExceptions.getDioException(e));
    }
  }
}
