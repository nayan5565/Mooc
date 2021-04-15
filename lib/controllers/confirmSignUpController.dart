import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/models/mSignUp.dart';
import 'package:mooc/network/apiCall.dart';
import 'package:mooc/tools/utils.dart';
import 'package:mooc/views/signIn/signInView.dart';

class ConfirmSignUpController extends GetxController {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmationCodeController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  final isLoading = false.obs, isResend = false.obs;
  List<String> mediums = ['Phone', 'Email'];
  final selectedMedium = 'Phone'.obs;

  confirmSignUp(String email, String phone, String medium) async {
    if (formKey.currentState.validate()) {
      isLoading.value = true;
      MSignUp mSignUp = await confirmSignUpApi(
          phone: phone,
          email: email,
          medium: medium,
          confirmationCode: confirmationCodeController.text);
      isLoading.value = false;
      if (!mSignUp.error)
        Get.to(() => SignInView());
      else
        showToast(mSignUp.message);
    }
  }

  resendCode(String email, String phone, String medium) async {
    isResend.value = true;
    MSignUp mSignUp = await resendConfirmationCodeApi(
        phone: phone, email: email, medium: medium);
    isResend.value = false;
    if (!mSignUp.error)
      showToast(mSignUp.message);
    else
      showToast(mSignUp.message);
  }
}
