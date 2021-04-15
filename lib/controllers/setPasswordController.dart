import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/models/mResponseBody.dart';
import 'package:mooc/network/apiCall.dart';
import 'package:mooc/tools/utils.dart';
import 'package:mooc/views/signIn/signInView.dart';

class SetPasswordController extends GetxController {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController(text: 'Nayan55');
  final confirmationCodeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final isLoading = false.obs, obscureText = true.obs;
  List<String> mediums = ['Phone', 'Email'];
  final selectedMedium = 'Phone'.obs;

  setInitValue(String email, String phone, String medium) {
    print(phone);
    emailController.text = email;
    phoneController.text = phone;
    selectedMedium.value = medium;
  }

  setPassword() async {
    if (formKey.currentState.validate()) {
      isLoading.value = true;
      MResponseBody mResponseBody = await setPasswordApi(
          phone: phoneController.text,
          email: emailController.text,
          newPassword: passwordController.text,
          confirmationCode: confirmationCodeController.text,
          medium: selectedMedium.value.toLowerCase());
      isLoading.value = false;
      showToast(mResponseBody.message);
      if (!mResponseBody.error) {
        Get.offAll(() => SignInView());
        // Navigator.pushAndRemoveUntil(
        //     context, MaterialPageRoute(builder: (context) => SignInView(),), (
        //     route) => false);
      }
    }
  }
}
