// To parse this JSON data, do
//
//     final mResponseBody = mResponseBodyFromJson(jsonString);

import 'dart:convert';

MResponseBody mResponseBodyFromJson(String str) =>
    MResponseBody.fromJson(json.decode(str));

String mResponseBodyToJson(MResponseBody data) => json.encode(data.toJson());

class MResponseBody {
  MResponseBody({
    this.error,
    this.code,
    this.message,
  });

  bool error;
  String code;
  String message;

  factory MResponseBody.fromJson(Map<String, dynamic> json) => MResponseBody(
        error: json["error"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "code": code,
        "message": message,
      };
}
