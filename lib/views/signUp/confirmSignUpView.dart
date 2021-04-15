import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/controllers/confirmSignUpController.dart';
import 'package:mooc/tools/customWidget.dart';
import 'package:mooc/tools/formValidation.dart';

class ConfirmSignUpView extends StatelessWidget {
  final confirmSignUpController = Get.put(ConfirmSignUpController());
  final email, phone, medium;

  ConfirmSignUpView({Key key, this.email, this.phone, this.medium})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Confirm Sign Up'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: confirmSignUpController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText('Confirmation Code', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              buildTextFormField(
                  controller:
                      confirmSignUpController.confirmationCodeController,
                  validator: (value) => validationConfirmationCode(value),
                  hintText: 'Confirmation Code',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number),
              SizedBox(
                height: 16,
              ),
              Obx(
                () => buildRoundedButton(
                    color: Colors.green,
                    radius: 0,
                    onTap: confirmSignUpController.isLoading.value
                        ? null
                        : () => confirmSignUpController.confirmSignUp(
                            email, phone, medium),
                    text: Center(
                        child: confirmSignUpController.isLoading.value
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white)
                            : Text(
                                'Confirm Sign Up',
                                style: TextStyle(color: Colors.white),
                              ))),
              ),
              SizedBox(
                height: 16,
              ),
              Obx(
                () => buildRoundedButton(
                    color: Colors.green,
                    radius: 0,
                    onTap: confirmSignUpController.isResend.value
                        ? null
                        : () => confirmSignUpController.resendCode(
                            email, phone, medium),
                    text: Center(
                        child: confirmSignUpController.isResend.value
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white)
                            : Text(
                                'Resend Code',
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
            value: confirmSignUpController.selectedMedium.value,
            onChanged: (String value) {
              confirmSignUpController.selectedMedium.value = value;
              FocusScope.of(Get.context).requestFocus(FocusNode());
            },
            items: confirmSignUpController.mediums.map((String value) {
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
