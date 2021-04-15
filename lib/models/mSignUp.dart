// To parse this JSON data, do
//
//     final mSignUp = mSignUpFromJson(jsonString);

import 'dart:convert';

MSignUp mSignUpFromJson(String str) => MSignUp.fromJson(json.decode(str));

String mSignUpToJson(MSignUp data) => json.encode(data.toJson());

class MSignUp {
  MSignUp({
    this.error,
    this.code,
    this.message,
    this.data,
  });

  bool error;
  String code;
  String message;
  SignUp data;

  factory MSignUp.fromJson(Map<String, dynamic> json) => MSignUp(
      error: json["error"],
      code: json["code"],
      message: json["message"],
      data: SignUp.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {
        "error": error,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class SignUp {
  SignUp({
    this.userConfirmed,
    this.codeDeliveryDetails,
    this.userSub,
    this.responseMetadata,
  });

  bool userConfirmed;
  CodeDeliveryDetails codeDeliveryDetails;
  String userSub;
  ResponseMetadata responseMetadata;

  factory SignUp.fromJson(Map<String, dynamic> json) {
    if (json == null || !json.containsKey("UserConfirmed")) return null;
    return SignUp(
      userConfirmed: json["UserConfirmed"] ?? false,
      codeDeliveryDetails:
          CodeDeliveryDetails.fromJson(json["CodeDeliveryDetails"] ?? null),
      userSub: json["UserSub"],
      responseMetadata:
          ResponseMetadata.fromJson(json["ResponseMetadata"] ?? null),
    );
  }

  Map<String, dynamic> toJson() => {
        "UserConfirmed": userConfirmed,
        "CodeDeliveryDetails": codeDeliveryDetails.toJson(),
        "UserSub": userSub,
        "ResponseMetadata": responseMetadata.toJson(),
      };
}

class CodeDeliveryDetails {
  CodeDeliveryDetails({
    this.destination,
    this.deliveryMedium,
    this.attributeName,
  });

  String destination;
  String deliveryMedium;
  String attributeName;

  factory CodeDeliveryDetails.fromJson(Map<String, dynamic> json) =>
      CodeDeliveryDetails(
        destination: json["Destination"],
        deliveryMedium: json["DeliveryMedium"],
        attributeName: json["AttributeName"],
      );

  Map<String, dynamic> toJson() => {
        "Destination": destination,
        "DeliveryMedium": deliveryMedium,
        "AttributeName": attributeName,
      };
}

class ResponseMetadata {
  ResponseMetadata({
    this.requestId,
    this.httpStatusCode,
    this.httpHeaders,
    this.retryAttempts,
  });

  String requestId;
  int httpStatusCode;
  HttpHeaders httpHeaders;
  int retryAttempts;

  factory ResponseMetadata.fromJson(Map<String, dynamic> json) =>
      ResponseMetadata(
        requestId: json["RequestId"],
        httpStatusCode: json["HTTPStatusCode"],
        httpHeaders: HttpHeaders.fromJson(json["HTTPHeaders"]),
        retryAttempts: json["RetryAttempts"],
      );

  Map<String, dynamic> toJson() => {
        "RequestId": requestId,
        "HTTPStatusCode": httpStatusCode,
        "HTTPHeaders": httpHeaders.toJson(),
        "RetryAttempts": retryAttempts,
      };
}

class HttpHeaders {
  HttpHeaders({
    this.date,
    this.contentType,
    this.contentLength,
    this.connection,
    this.xAmznRequestid,
  });

  String date;
  String contentType;
  String contentLength;
  String connection;
  String xAmznRequestid;

  factory HttpHeaders.fromJson(Map<String, dynamic> json) => HttpHeaders(
        date: json["date"],
        contentType: json["content-type"],
        contentLength: json["content-length"],
        connection: json["connection"],
        xAmznRequestid: json["x-amzn-requestid"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "content-type": contentType,
        "content-length": contentLength,
        "connection": connection,
        "x-amzn-requestid": xAmznRequestid,
      };
}
