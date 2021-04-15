import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mooc/models/MUser.dart';
import 'package:mooc/models/mConfirmationCodeValidity.dart';
import 'package:mooc/models/mResponseBody.dart';
import 'package:mooc/models/mSignUp.dart';
import 'package:mooc/models/mVerifyStatus.dart';
import 'dart:convert' as convert;

import 'package:mooc/tools/apiInfo.dart';

Future<MSignUp> signUpApi(
    {String phone,
    String email,
    String name,
    String medium,
    String role,
    String password}) async {
  var url = baseUrl + signup;
  try {
    Map data = {
      "name": name,
      "medium": medium,
      "phone": phone,
      "email": email,
      "role": role,
      "password": password
    };
    //encode Map to JSON
    var body = jsonEncode(data);

    print("body: $body");

    var response = await http.post(Uri.parse(url),
//          headers: {"Content-Type": "application/json"},
        body: body);
    print('Response sign status: ${response.statusCode}');
    print('Response sign body: ${response.body}');
    MSignUp mSignUp = mSignUpFromJson(response.body);
    return mSignUp;
    // if (response.statusCode == 200) {
    //   // var jsonResponse = convert.jsonDecode(response.body);
    //   MSignUp mSignUp = mSignUpFromJson(response.body);
    //   return mSignUp;
    // } else
    //   return MSignUp();
  } catch (e) {
    print('Response sign error: $e');
    return MSignUp(error: true, message: e.toString());
  }
}

Future<MSignUp> confirmSignUpApi(
    {String phone,
    String email,
    String medium,
    String confirmationCode}) async {
  var url = baseUrl + confirmSignUp;
  try {
    Map data = {
      "medium": medium,
      "email": email,
      "phone": phone,
      "confirmationCode": confirmationCode
    };
    //encode Map to JSON
    var body = jsonEncode(data);

    print("Confirm body: $body");

    var response = await http.post(Uri.parse(url), body: body);
    print('Response confirm status: ${response.statusCode}');
    print('Response confirm body: ${response.body}');
    MSignUp mSignUp = mSignUpFromJson(response.body);
    return mSignUp;
  } catch (e) {
    print('Response confirm error: $e');
    return MSignUp(error: true, message: e.toString());
  }
}

Future<MSignUp> resendConfirmationCodeApi(
    {String phone, String email, String medium}) async {
  var url = baseUrl + resendConfirmationCode;
  try {
    Map data = {"medium": medium, "email": email, "phone": phone};
    //encode Map to JSON
    var body = jsonEncode(data);

    print("resend body: $body");

    var response = await http.post(Uri.parse(url), body: body);
    print('Response resend status: ${response.statusCode}');
    print('Response resend body: ${response.body}');
    MSignUp mSignUp = mSignUpFromJson(response.body);
    return mSignUp;
  } catch (e) {
    print('Response resend error: $e');
    return MSignUp(error: true, message: e.toString());
  }
}

Future<MVerifyStatus> verifiedStatusApi(
    {String phone, String email, String medium}) async {
  var url = baseUrl + verifiedStatus;
  try {
    Map data = {"medium": medium, "email": email, "phone": phone};
    //encode Map to JSON
    var body = jsonEncode(data);

    print("verifiedStatus body: $body");

    var response = await http.post(Uri.parse(url), body: body);
    print('Response verifiedStatus status: ${response.statusCode}');
    print('Response verifiedStatus body: ${response.body}');
    MVerifyStatus mVerifyStatus = mVerifyStatusFromJson(response.body);
    return mVerifyStatus;
  } catch (e) {
    print('Response verifiedStatus error: $e');
    return MVerifyStatus(error: true, message: e.toString());
  }
}

Future<MConfirmationCodeValidity> confirmationCodeValidityApi(
    {String phone, String email, String medium}) async {
  var url = baseUrl + confirmationCodeValidity;
  try {
    Map data = {"medium": medium, "email": email, "phone": phone};
    //encode Map to JSON
    var body = jsonEncode(data);

    print("confirmationCodeValidity body: $body");

    var response = await http.post(Uri.parse(url), body: body);
    print('Response confirmationCodeValidity status: ${response.statusCode}');
    print('Response confirmationCodeValidity body: ${response.body}');
    MConfirmationCodeValidity mConfirmationCodeValidity =
        mConfirmationCodeValidityFromJson(response.body);
    return mConfirmationCodeValidity;
  } catch (e) {
    print('Response confirmationCodeValidity error: $e');
    return MConfirmationCodeValidity(error: true, message: e.toString());
  }
}

Future<MUser> signInApi(
    {String phone, String email, String medium, String password}) async {
  var url = baseUrl + signIn;
  try {
    Map data = {
      "medium": medium,
      "email": email,
      "phone": phone,
      "password": password
    };
    //encode Map to JSON
    var body = jsonEncode(data);

    print("user body: $body");

    var response = await http.post(Uri.parse(url), body: body);
    print('Response user status: ${response.statusCode}');
    print('Response user body: ${response.body}');
    MUser mUser = mUserFromJson(response.body);
    return mUser;
  } catch (e) {
    print('Response user error: $e');
    return MUser(error: true, message: e.toString());
  }
}

Future<MResponseBody> forgotPasswordApi(
    {String phone, String email, String medium}) async {
  var url = baseUrl + forgotPassword;
  try {
    Map data = {"medium": medium, "email": email, "phone": phone};
    var body = jsonEncode(data);
    print("forgotPassword body: $body");

    var response = await http.post(Uri.parse(url), body: body);
    print('Response forgotPassword status: ${response.statusCode}');
    print('Response forgotPassword body: ${response.body}');
    MResponseBody mResponseBody = mResponseBodyFromJson(response.body);
    return mResponseBody;
  } catch (e) {
    print('Response forgotPassword error: $e');
    return MResponseBody(error: true, message: e.toString());
  }
}

Future<MResponseBody> setPasswordApi(
    {String phone,
    String email,
    String medium,
    String newPassword,
    String confirmationCode}) async {
  var url = baseUrl + setPassword;
  try {
    Map data = {
      "medium": medium,
      "email": email,
      "phone": phone,
      "newPassword": newPassword,
      "confirmationCode": confirmationCode
    };
    var body = jsonEncode(data);
    print("resetPassword body: $body");

    var response = await http.post(Uri.parse(url), body: body);
    print('Response resetPassword status: ${response.statusCode}');
    print('Response resetPassword body: ${response.body}');
    MResponseBody mResponseBody = mResponseBodyFromJson(response.body);
    return mResponseBody;
  } catch (e) {
    print('Response resetPassword error: $e');
    return MResponseBody(error: true, message: e.toString());
  }
}

Future<MResponseBody> addRecoveryEmailApi(
    {String userId, String recoveryEmail}) async {
  var url = baseUrl + addRecoveryEmail;
  try {
    Map data = {"userId": userId, "recoveryEmail": recoveryEmail};
    var body = jsonEncode(data);
    print("addRecoveryEmail body: $body");

    var response = await http.post(Uri.parse(url), body: body);
    print('Response addRecoveryEmail status: ${response.statusCode}');
    print('Response addRecoveryEmail body: ${response.body}');
    MResponseBody mResponseBody = mResponseBodyFromJson(response.body);
    return mResponseBody;
  } catch (e) {
    print('Response addRecoveryEmail error: $e');
    return MResponseBody(error: true, message: e.toString());
  }
}
