// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:convert';

import 'package:biapay_app/app/configs/enums.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final box = StorageData();
mixin Config {
  static final keys = _Keys();
  static final colors = _Colors();
  static const appName = "BIAPAY App";
  static const user = "USER";
  static const merchant = "MERCHANT";
  static const merchantId = "merchantId";
  static final double defaultPadding = 20.w;

}

class _Keys {
  final tokenKey = "tokenKeys";
  final country = "country";
  final localLanguage = "localLanguage";
  final userType = "userType";
  final rememberMeCustomer = "rememberMe";
  final rememberMemerchant = "rememberMe";
  final enabledBiometric = "enabledBiometric";
  final userAuth = "userAuthKey";
  final  merchantAuth = "merchantAuth";
  final kyc = "kycKey";
  final statusTicketKey = "statusTicketKey";
  final priorityTicketKey = "priorityTicketKey";
  final merchantId = "merchantId";

  final user = "USER";
  final merchant = "MERCHANT";
}

class _Colors {
  final primaryColor = Color(0xFF1d2f53);
  final qrCodeColor = Color(0xFF102B60);
  final greenColor = Color(0xFF89ac34);
  final blueColor = Color(0xFF2A447D);
  final blueColor2 = Color(0xFF2C477C);
  final greyColor = Color(0xFF726C6C);
  final redColor = Color(0xFFFF3535);
  final greyColor2 = Color(0xFF464444);
  final greyColor3 = Color(0xFFA8A7A7);
  final whiteColor = Color(0xFFE5F6FE);
}

String get initialRoute =>
    // box.read(Config.keys.tokenKey) != null
    isLogin ? Routes.BASE_APP : Routes.SPLASH;

bool get isLogin {
  final token = box.read(Config.keys.tokenKey);
  if (token != null) {
    final hasExpired = JwtDecoder.isExpired(token);
    print(JwtDecoder.getExpirationDate(token).toLocal());
    // if(hasExpired && Get.currentRoute!=)
    return !hasExpired;
  }
  return false;
}

UserType get userType => box.read(Config.keys.userType) == "USER"
    ? UserType.USER
    : UserType.MERCHANT;
bool get isMerchant => box.read(Config.keys.userType) == "MERCHANT";
bool get isUser => box.read(Config.keys.userType) == "USER";

class EncryptData {
  final _key = Key.fromUtf8("r7lQqfxeKOcZxPVpjgqVt1GNmsPLw4vj");
  final _iv = IV.fromLength(16);

  String cryptData(String data) {
    final encrypter = Encrypter(AES(_key));
    final encrypted = encrypter.encrypt(data, iv: _iv);
    return encrypted.base64;
  }

  String decryptData(String data) {
    final encrypter = Encrypter(AES(_key));
    final decrypted = encrypter.decrypt(Encrypted.from64(data), iv: _iv);
    return decrypted;
  }
}

class StorageData {
  // static final box = GetStorage();
  GetStorage box = GetStorage();
  Future<void> write(String key, dynamic value) async {
    if (value == null) {
      await box.write(key, value);
      return null;
    }
    await box.write(key, EncryptData().cryptData(json.encode(value)));
    return;
  }

  Future<void> remove(String key) async {
    await box.remove(key);
    return;
  }

  T? read<T>(String key) {
    final value = box.read(key);
    if (value == null) return null;
    return json.decode(EncryptData().decryptData(value)) as T;
  }

  Future<void> clear() async {
    await box.erase();
    return;
  }

  void listenKey(String key, ValueSetter callback) {
    box.listenKey(key, (value) {
      callback.call(json.decode(EncryptData().decryptData(value)));
    });
  }
}
