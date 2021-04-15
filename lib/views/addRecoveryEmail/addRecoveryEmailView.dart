import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/controllers/addRecoveryEmailController.dart';
import 'package:mooc/tools/customWidget.dart';
import 'package:mooc/tools/formValidation.dart';

class AddRecoveryEmailView extends StatelessWidget {
  final addRecoveryEmailController = Get.put(AddRecoveryEmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: buildText('Add recovery email', Colors.white, 18),
          backgroundColor: Colors.green,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      child: Form(
        key: addRecoveryEmailController.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText('Recovery Email', Colors.black, 16),
            SizedBox(
              height: 8,
            ),
            buildTextFormField(
                controller: addRecoveryEmailController.emailController,
                validator: (value) => validationEmail(value),
                hintText: 'Recovery Email',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress),
            SizedBox(
              height: 16,
            ),
            Obx(
              () => buildRoundedButton(
                  color: Colors.green,
                  radius: 0,
                  onTap: addRecoveryEmailController.isLoading.value
                      ? null
                      : () => addRecoveryEmailController.addRecoveryEmail(),
                  text: Center(
                      child: addRecoveryEmailController.isLoading.value
                          ? CircularProgressIndicator(
                              backgroundColor: Colors.white)
                          : Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ))),
            ),
          ],
        ),
      ),
    );
  }
}
