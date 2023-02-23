import 'dart:convert';

List<AfricanCountry> africanCountryFromJson(String str) =>
    List<AfricanCountry>.from((json.decode(str) as List).map((x) {
      return AfricanCountry.fromJson(x as Map<String, dynamic>);
    }));

String africanCountryToJson(List<AfricanCountry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AfricanCountry {
  AfricanCountry(
      {required this.name,
      required this.code,
      required this.dialCode,
      required this.length,
      required this.flag});

  String name;
  String code;
  String dialCode;
  int length;
  String flag;

  factory AfricanCountry.fromJson(Map<String, dynamic> json) => AfricanCountry(
        name: json["name"] != null ? json["name"] as String : "",
        code: json["code"] != null ? json["code"] as String : "",
        dialCode: json["dial_code"] != null ? json["dial_code"] as String : "",
        length: json["length"] != null ? json["length"] as int : 0,
        flag: json["flag"] != null ? json["flag"] as String : "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "dial_code": dialCode,
        "length": length,
        "flag": flag,
      };
}
