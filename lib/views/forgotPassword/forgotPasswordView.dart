import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/controllers/forgotPasswordController.dart';
import 'package:mooc/tools/customWidget.dart';
import 'package:mooc/tools/formValidation.dart';
import 'package:mooc/views/signIn/signInView.dart';

class ForgotPasswordView extends StatelessWidget {
  final forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => SignInView());
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: forgotPasswordController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText('Email', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              buildTextFormField(
                  controller: forgotPasswordController.emailController,
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
                  controller: forgotPasswordController.phoneController,
                  hintText: 'Phone',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone),
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
                    onTap: forgotPasswordController.isLoading.value
                        ? null
                        : () => forgotPasswordController.forgotPassword(),
                    text: Center(
                        child: forgotPasswordController.isLoading.value
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white)
                            : Text(
                                'Reset Password',
                                style: TextStyle(color: Colors.white),
                              ))),
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
            value: forgotPasswordController.selectedMedium.value,
            onChanged: (String value) {
              forgotPasswordController.selectedMedium.value = value;
              FocusScope.of(Get.context).requestFocus(FocusNode());
            },
            items: forgotPasswordController.mediums.map((String value) {
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
