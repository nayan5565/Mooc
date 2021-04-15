import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/controllers/authController.dart';
import 'package:mooc/models/MUser.dart';
import 'package:mooc/network/apiCall.dart';
import 'package:mooc/tools/utils.dart';
import 'package:mooc/views/home/homeView.dart';

class SignInController extends GetxController {
  final AuthController authController = Get.find();
  final emailController = TextEditingController(text: 'nayan@gmail.com');
  final phoneController = TextEditingController(text: '+8801629683563');
  final passwordController = TextEditingController(text: 'Nayan55');
  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs, obscureText = true.obs;
  List<String> mediums = ['Phone', 'Email'];
  final selectedMedium = 'Phone'.obs;

  signIn() async {
    if (formKey.currentState.validate()) {
      isLoading.value = true;
      authController.mUser.value = await signInApi(
          phone: phoneController.text,
          email: emailController.text,
          password: passwordController.text,
          medium: selectedMedium.value.toLowerCase());
      isLoading.value = false;
      if (!authController.mUser.value.error)
        Get.offAll(() => HomeView());
      else
        showToast(authController.mUser.value.message);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    phoneController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }
}
