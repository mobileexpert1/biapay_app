import 'dart:convert';
import 'dart:io';

import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class Kyc {
  int? id;
  String? client;
  String? name;
  String? dateofbirth;
  String? emailid;
  double? mobileno;
  String? addressone;
  String? addresstwo;
  String? city;
  String? state;
  String? country;
  int? zipcode;
  double? longitude;
  double? latitude;
  int? customerDataId;
  IdentityInformation? identityInformation;
  String? kycApprovalStatus;

  Kyc(
      {this.id,
      this.client,
      this.name,
      this.dateofbirth,
      this.emailid,
      this.mobileno,
      this.addressone,
      this.addresstwo,
      this.city,
      this.state,
      this.country,
      this.zipcode,
      this.longitude,
      this.latitude,
      this.customerDataId,
      this.identityInformation,
      this.kycApprovalStatus});

  Kyc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    client = json['client'];
    name = json['name'];
    dateofbirth = json['dateofbirth'];
    emailid = json['emailid'];
    mobileno = json['mobileno'];
    addressone = json['addressone'];
    addresstwo = json['addresstwo'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipcode = json['zipcode'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    customerDataId = json['customerDataId'];
    identityInformation = json['identityInformation'] != null
        ? IdentityInformation?.fromJson(json['identityInformation'])
        : null;
    kycApprovalStatus = json['kycApprovalStatus'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['client'] = client;
    data['name'] = name;
    data['dateofbirth'] = dateofbirth;
    data['emailid'] = emailid;
    data['mobileno'] = mobileno;
    data['addressone'] = addressone;
    data['addresstwo'] = addresstwo;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['zipcode'] = zipcode;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['customerDataId'] = customerDataId;
    if (identityInformation != null) {
      data['identityInformation'] = identityInformation?.toJson();
    }
    data['kycApprovalStatus'] = kycApprovalStatus;
    return data;
  }
}

class IdentityInformation {
  String? identification;
  double? number;
  String? dateofdelivery;
  String? stateofdelivery;
  String? endofvaliditydate;
  String? uploadproof;
  String? addressproof;
  String? uploadProofContentType;
  String? addressProofContentType;
  final addressProofFile = Rx<File?>(null);
  final uploadProofFile = Rx<File?>(null);

  IdentityInformation(
      {this.identification,
      this.number,
      this.dateofdelivery,
      this.stateofdelivery,
      this.endofvaliditydate,
      this.uploadproof,
      this.addressproof,
      this.uploadProofContentType,
      this.addressProofContentType});

  IdentityInformation.fromJson(Map<String, dynamic> json) {
    identification = json['identification'];
    number = json['number'];
    dateofdelivery = json['dateofdelivery'];
    stateofdelivery = json['stateofdelivery'];
    endofvaliditydate = json['endofvaliditydate'];
    uploadproof = json['uploadproof'];
    addressproof = json['addressproof'];
    if (json['uploadproof_path'] != null)
      uploadProofFile.value = File(json['uploadproof_path']);
    if (json['addressproof_path'] != null)
      addressProofFile.value = File(json['addressproof_path']);
    uploadProofContentType = json['uploadProofContentType'];
    addressProofContentType = json['addressProofContentType'];
    getFileProof();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['identification'] = identification;
    data['number'] = number;
    data['dateofdelivery'] = dateofdelivery;
    data['stateofdelivery'] = stateofdelivery;
    data['endofvaliditydate'] = endofvaliditydate;
    data['uploadproof'] = uploadproof;
    data['addressproof'] = addressproof;
    data['uploadproof_path'] = uploadProofFile.value?.path;
    data['addressproof_path'] = addressProofFile.value?.path;
    data['uploadProofContentType'] = uploadProofContentType;
    data['addressProofContentType'] = addressProofContentType;
    return data;
  }

  Future<void> getFileProof() async {
    final tempDir = await getTemporaryDirectory();
    if (uploadproof != null) {
      Uint8List imageInUnit8List = base64.decode(uploadproof!);
      File upload = await File(
              '${tempDir.path}/uploadproof.${_ext(uploadProofContentType!)}')
          .create();
      upload.writeAsBytesSync(imageInUnit8List);
      uploadProofFile(upload);
    }
    if (addressproof != null) {
      Uint8List imageInUnit8List = base64.decode(addressproof!);
      File address = await File(
              '${tempDir.path}/addressproof.${_ext(addressProofContentType!)}')
          .create();
      address.writeAsBytesSync(imageInUnit8List);
      addressProofFile(address);
    }
  }

  String _ext(String value) {
    return value.contains("png")
        ? "png"
        : value.contains("jpeg")
            ? "jpeg"
            : "jpg";
  }

  bool isImage(File file) => _ext(file.path) != "pdf";
  bool isPdf(File file) => _ext(file.path) == "pdf";
}
