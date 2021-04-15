// To parse this JSON data, do
//
//     final mUser = mUserFromJson(jsonString);

import 'dart:convert';

MUser mUserFromJson(String str) => MUser.fromJson(json.decode(str));

String mUserToJson(MUser data) => json.encode(data.toJson());

class MUser {
  MUser({
    this.error,
    this.code,
    this.message,
    this.data,
  });

  bool error;
  String code;
  String message;
  User data;

  factory MUser.fromJson(Map<String, dynamic> json) => MUser(
        error: json["error"],
        code: json["code"],
        message: json["message"],
        data: json == null || json.isEmpty || json["error"] == true
            ? null
            : User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class User {
  User({
    this.myEmail,
    this.userId,
    this.idToken,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.tokenType,
    this.accessKey,
    this.secretKey,
    this.sessionToken,
  });

  String myEmail;
  String userId;
  String idToken;
  String accessToken;
  String refreshToken;
  int expiresIn;
  String tokenType;
  String accessKey;
  String secretKey;
  String sessionToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        myEmail: json["myEmail"],
        userId: json["userId"],
        idToken: json["idToken"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
        tokenType: json["tokenType"],
        accessKey: json["accessKey"],
        secretKey: json["secretKey"],
        sessionToken: json["sessionToken"],
      );

  Map<String, dynamic> toJson() => {
        "myEmail": myEmail,
        "userId": userId,
        "idToken": idToken,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "tokenType": tokenType,
        "accessKey": accessKey,
        "secretKey": secretKey,
        "sessionToken": sessionToken,
      };
}
