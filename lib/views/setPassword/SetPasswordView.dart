import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/controllers/setPasswordController.dart';
import 'package:mooc/tools/customWidget.dart';
import 'package:mooc/tools/formValidation.dart';
import 'package:mooc/views/forgotPassword/forgotPasswordView.dart';

class SetPasswordView extends StatelessWidget {
  final setPasswordController = Get.put(SetPasswordController());
  final email, phone, medium;

  SetPasswordView({Key key, this.email, this.phone, this.medium})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPasswordController.setInitValue(email, phone, medium);
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => ForgotPasswordView());
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
          key: setPasswordController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText('Email', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              buildTextFormField(
                  controller: setPasswordController.emailController,
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
                  controller: setPasswordController.phoneController,
                  hintText: 'Phone',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone),
              SizedBox(
                height: 16,
              ),
              buildText('New Password', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              Obx(
                () => buildTextFormField(
                    controller: setPasswordController.passwordController,
                    validator: (value) => validationPassword(value),
                    suffixIcon: InkWell(
                      onTap: () => setPasswordController.obscureText.toggle(),
                      child: Icon(
                        setPasswordController.obscureText.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    obscureText: setPasswordController.obscureText.value,
                    maxLines: 1,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(
                height: 16,
              ),
              buildText('Confirmation Code', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              buildTextFormField(
                  controller: setPasswordController.confirmationCodeController,
                  validator: (value) => validationConfirmationCode(value),
                  hintText: 'Confirmation Code',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number),
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
                    onTap: setPasswordController.isLoading.value
                        ? null
                        : () => setPasswordController.setPassword(),
                    text: Center(
                        child: setPasswordController.isLoading.value
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white)
                            : Text(
                                'Set Password',
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
            value: setPasswordController.selectedMedium.value,
            onChanged: (String value) {
              setPasswordController.selectedMedium.value = value;
              FocusScope.of(Get.context).requestFocus(FocusNode());
            },
            items: setPasswordController.mediums.map((String value) {
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
