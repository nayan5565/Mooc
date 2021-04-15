import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mooc/models/mSignUp.dart';
import 'package:mooc/network/apiCall.dart';
import 'package:mooc/tools/utils.dart';
import 'package:mooc/views/signUp/confirmSignUpView.dart';

class SignUpController extends GetxController {
  final nameController = TextEditingController(text: 'nayan');
  final emailController = TextEditingController(text: 'nayan@gmail.com');
  final phoneController = TextEditingController(text: '+8801629683563');
  final passwordController = TextEditingController(text: 'Nayan5565');
  var formKey = GlobalKey<FormState>();
  final isLoading = false.obs, obscureText = true.obs;
  List<String> roles = ['Student', 'Mentor'];
  List<String> mediums = ['Phone', 'Email'];
  final selectedRole = 'Student'.obs;
  final selectedMedium = 'Phone'.obs;

  signUp() async {
    if (formKey.currentState.validate()) {
      isLoading.value = true;
      MSignUp mSignUp = await signUpApi(
          name: nameController.text,
          phone: phoneController.text,
          email: emailController.text,
          password: passwordController.text,
          medium: selectedMedium.value.toLowerCase(),
          role: selectedRole.value.toLowerCase());
      isLoading.value = false;
      if (!mSignUp.error)
        Get.to(() => ConfirmSignUpView(
              email: emailController.text,
              phone: phoneController.text,
              medium: selectedMedium.toLowerCase(),
            ));
      else
        showToast(mSignUp.message);
    }
  }
}
