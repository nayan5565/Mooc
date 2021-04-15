import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/models/mResponseBody.dart';
import 'package:mooc/network/apiCall.dart';
import 'package:mooc/tools/utils.dart';

import 'authController.dart';

class AddRecoveryEmailController extends GetxController {
  final AuthController authController = Get.find();
  final emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  addRecoveryEmail() async {
    if (formKey.currentState.validate()) {
      isLoading.value = true;
      MResponseBody mResponseBody = await addRecoveryEmailApi(
          userId: authController.mUser.value.data.userId,
          recoveryEmail: emailController.text);
      isLoading.value = false;
      if (!mResponseBody.error)
        showToast(mResponseBody.message);
      else
        showToast(mResponseBody.message);
    }
  }
}
