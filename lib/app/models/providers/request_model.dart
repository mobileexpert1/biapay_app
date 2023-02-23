
import '../../configs/configs.dart';
import '../../widgets/export_file.dart';

loginRequestModel({email,password,userType}){
  Map<String,dynamic> map= Map();
  map['email']=email;
  map['password']=password;
  map['userType']=box.read(Config.keys.userType)??"USER";
  return map;
}


otpGenerateRequestModel({phoneNumber}){
  Map<String,dynamic> map= Map();
  map['phoneNumber']=phoneNumber;
  map['smsTemplate']="CUSTOMER_PHONE_VERIFY";
  map['locale']=Get.locale!.languageCode;
  map['userType']=box.read(Config.keys.userType)?? "USER";
  return map;
}

otpvalidateRequestModel({phoneNumber,otpCode}){
  Map<String,dynamic> map= Map();
  map['phoneNumber']=phoneNumber;
  map['mfaCode']=otpCode;
  map['userType']=box.read(Config.keys.userType)?? "USER";
  return map;
}


 privateUserRegisterRequestModel({email,phoneNo
 ,twoFactorStatus,password,firstName,lastName,confirmPassword,securityAnswers}){
  Map<String,dynamic> map= Map();
  map['email']=email;
  map['phoneNo']=phoneNo;
  map['twoFactorStatus']=twoFactorStatus;
  map['password']=password;
  map['firstName']=firstName;
  map['lastName']=lastName;
  map['confirmPassword']=confirmPassword;
  map['securityAnswers']=securityAnswers;
   return map;
}

recoveryQuestionRequestModel({email,userType}){
  Map<String,dynamic> map= Map();
  map['email']=email;
  map['userType']=box.read(Config.keys.userType)??"USER";
  return map;
}

changePasswordRecoverRequestModel({newPassword,confirmNewPassword,resetPwdToken}){
  Map<String,dynamic> map= Map();
  map['newPassword']=newPassword;
  map['confirmNewPassword']=confirmNewPassword;
  map['resetPwdToken']=resetPwdToken;
  return map;
}

changePasswordRequestModel({oldPassword,newPassword,confirmNewPassword}){
  Map<String,dynamic> map= Map();
  map['oldPassword']=oldPassword;
  map['newPassword']=newPassword;
  map['confirmNewPassword']=confirmNewPassword;
  return map;
}


recoverOtpRequestModel({mobile,userType}){
  Map<String,dynamic> map= Map();
  map['mobile']=mobile;
  map['userType']=box.read(Config.keys.userType)??"USER";
  return map;
}



otpQuestionRecoverRequestModel({email,
  answers}){
  Map<String,dynamic> map= Map();
  map['email']=email;
  map['userType']=box.read(Config.keys.userType)??"USER";
  map['answers']=answers;
  return map;
}


addTicketRequestModel({title, content,priority,attachments}){
  Map<String,dynamic> map= Map();
  map['title']=title;
  map['content']=content;
  map['priority']=priority;
  map['status']= "OPENED";
  map['attachments']= attachments;
  return map;
}


