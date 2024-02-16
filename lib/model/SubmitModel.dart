import 'dart:convert';
SubmitModel submitFromJson(String str) =>SubmitModel.fromJson(json.decode(str));
class SubmitModel {
  String? status;
  String? message;

  SubmitModel({this.status, this.message});

  SubmitModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Message'] = this.message;
    return data;
  }

}