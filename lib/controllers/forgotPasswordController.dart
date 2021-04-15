import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/models/mResponseBody.dart';
import 'package:mooc/network/apiCall.dart';
import 'package:mooc/tools/utils.dart';
import 'package:mooc/views/setPassword/SetPasswordView.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController(text: 'nayan@gmail.com');
  final phoneController = TextEditingController(text: '+8801629683563');
  var formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  List<String> mediums = ['Phone', 'Email'];
  final selectedMedium = 'Phone'.obs;

  forgotPassword() async {
    if (formKey.currentState.validate()) {
      isLoading.value = true;
      MResponseBody mResponseBody = await forgotPasswordApi(
          phone: phoneController.text,
          email: emailController.text,
          medium: selectedMedium.value.toLowerCase());
      isLoading.value = false;
      if (!mResponseBody.error)
        Get.off(() => SetPasswordView(
              medium: selectedMedium.value,
              phone: phoneController.text,
              email: emailController.text,
            ));
      else
        showToast(mResponseBody.message);
    }
  }
}
