// To parse this JSON data, do
//
//     final mVerifyStatus = mVerifyStatusFromJson(jsonString);

import 'dart:convert';

MVerifyStatus mVerifyStatusFromJson(String str) =>
    MVerifyStatus.fromJson(json.decode(str));

String mVerifyStatusToJson(MVerifyStatus data) => json.encode(data.toJson());

class MVerifyStatus {
  MVerifyStatus({
    this.error,
    this.code,
    this.message,
    this.data,
  });

  bool error;
  String code;
  String message;
  VerifyStatus data;

  factory MVerifyStatus.fromJson(Map<String, dynamic> json) => MVerifyStatus(
        error: json["error"],
        code: json["code"],
        message: json["message"],
        data: VerifyStatus.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class VerifyStatus {
  VerifyStatus({
    this.emailVerified,
    this.phoneVerified,
  });

  String emailVerified;
  String phoneVerified;

  factory VerifyStatus.fromJson(Map<String, dynamic> json) {
    if (json == null || !json.containsKey("emailVerified")) return null;
    return VerifyStatus(
      emailVerified: json["emailVerified"],
      phoneVerified: json["phoneVerified"],
    );
  }

  Map<String, dynamic> toJson() => {
        "emailVerified": emailVerified,
        "phoneVerified": phoneVerified,
      };
}
