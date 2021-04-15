// To parse this JSON data, do
//
//     final mConfirmationCodeValidity = mConfirmationCodeValidityFromJson(jsonString);

import 'dart:convert';

MConfirmationCodeValidity mConfirmationCodeValidityFromJson(String str) =>
    MConfirmationCodeValidity.fromJson(json.decode(str));

String mConfirmationCodeValidityToJson(MConfirmationCodeValidity data) =>
    json.encode(data.toJson());

class MConfirmationCodeValidity {
  MConfirmationCodeValidity({
    this.error,
    this.code,
    this.message,
    this.data,
  });

  bool error;
  String code;
  String message;
  ConfirmationCodeValidity data;

  factory MConfirmationCodeValidity.fromJson(Map<String, dynamic> json) =>
      MConfirmationCodeValidity(
        error: json["error"],
        code: json["code"],
        message: json["message"],
        data: ConfirmationCodeValidity.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class ConfirmationCodeValidity {
  ConfirmationCodeValidity({
    this.isValid,
  });

  bool isValid;

  factory ConfirmationCodeValidity.fromJson(Map<String, dynamic> json) =>
      ConfirmationCodeValidity(
        isValid: json == null || json.isEmpty || json["isValid"] == null
            ? null
            : json["isValid"],
      );

  Map<String, dynamic> toJson() => {
        "isValid": isValid,
      };
}
