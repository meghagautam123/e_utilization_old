/*
class LoginModel {
  final String title;
  final String status;

  const LoginModel(
      {required this.title,required this.status});


  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
    title: json['name'],status: json['status'] );
  }
}*/
import 'dart:convert';

LoginModel loginFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String status;
  String token;
  List<Datum> data;

  LoginModel({
    required this.status,
    required this.token,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    token: json["token"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    //  List<SampleDataItem> sampleListFromPreferance = List<SampleDataItem>.from(jsonMap.map((x) => SampleDataItem.fromJson(x)));

  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "token": token,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String userid;
  String username;
  String password;
  String usertypeid;
  String controllerid;
  String paoid;
  String ddoid;
  String firstname;
  String lastname;
  String email;
  String mobile;

  Datum({
    required this.userid,
    required this.username,
    required this.password,
    required this.usertypeid,
    required this.controllerid,
    required this.paoid,
    required this.ddoid,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userid: json["userid"],
    username: json["username"],
    password: json["password"],
    usertypeid: json["usertypeid"],
    controllerid: json["controllerid"],
    paoid: json["paoid"],
    ddoid: json["ddoid"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "username": username,
    "password": password,
    "usertypeid": usertypeid,
    "controllerid": controllerid,
    "paoid": paoid,
    "ddoid": ddoid,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "mobile": mobile,
  };
}