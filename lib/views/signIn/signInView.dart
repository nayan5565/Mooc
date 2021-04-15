import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/controllers/signInController.dart';
import 'package:mooc/tools/customWidget.dart';
import 'package:mooc/tools/formValidation.dart';
import 'package:mooc/views/forgotPassword/forgotPasswordView.dart';
import 'package:mooc/views/signUp/signUpView.dart';

class SignInView extends StatelessWidget {
  final signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: signInController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText('Email', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              buildTextFormField(
                  controller: signInController.emailController,
                  validator: (value) => validationEmail(value),
                  hintText: 'Email',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 16,
              ),
              buildText('Phone', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              buildTextFormField(
                  controller: signInController.phoneController,
                  hintText: 'Phone',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone),
              SizedBox(
                height: 16,
              ),
              buildText('Password', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              Obx(
                () => buildTextFormField(
                    controller: signInController.passwordController,
                    validator: (value) => validationPassword(value),
                    suffixIcon: InkWell(
                      onTap: () => signInController.obscureText.toggle(),
                      child: Icon(
                        signInController.obscureText.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    obscureText: signInController.obscureText.value,
                    maxLines: 1,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(
                height: 16,
              ),
              buildText('Medium', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              _buildMediumDropDown(),
              SizedBox(
                height: 16,
              ),
              Obx(
                () => buildRoundedButton(
                    color: Colors.green,
                    radius: 0,
                    onTap: signInController.isLoading.value
                        ? null
                        : () => signInController.signIn(),
                    text: Center(
                        child: signInController.isLoading.value
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white)
                            : Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              ))),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: TextButton(
                    onPressed: () => Get.off(() => ForgotPasswordView()),
                    child: buildText('Forgot password?', Colors.black, 16,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMediumDropDown() {
    return Container(
        height: 50,
        padding: EdgeInsets.only(right: 16, left: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: Obx(
          () => DropdownButton<String>(
            hint: buildText('Phone', Colors.black, 18),
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            isExpanded: true,
            value: signInController.selectedMedium.value,
            onChanged: (String value) {
              signInController.selectedMedium.value = value;
              FocusScope.of(Get.context).requestFocus(FocusNode());
            },
            items: signInController.mediums.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
