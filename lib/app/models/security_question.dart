class SecurityModel {
  var id;
  var question;
  var published;
  var code;
  var lang;

  SecurityModel({this.id, this.question, this.published, this.code, this.lang});

  SecurityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    published = json['published'];
    code = json['code'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['published'] = this.published;
    data['code'] = this.code;
    data['lang'] = this.lang;
    return data;
  }
}