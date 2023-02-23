class RecoveryModel {
  String? email;
  String? userType;
  String? mobile;
  List<QuestionModel>? questions;

  RecoveryModel({this.email, this.userType, this.mobile, this.questions});

  RecoveryModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userType = json['userType'];
    mobile = json['mobile'];
    if (json['questions'] != null) {
      questions = <QuestionModel>[];
      json['questions'].forEach((v) {
        questions!.add(new QuestionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['userType'] = this.userType;
    data['mobile'] = this.mobile;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionModel {
  int? id;
  String? question;
  bool? published;
  String? lang;
  String? code;

  QuestionModel({this.id, this.question, this.published, this.lang, this.code});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    published = json['published'];
    lang = json['lang'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['published'] = this.published;
    data['lang'] = this.lang;
    data['code'] = this.code;
    return data;
  }
}