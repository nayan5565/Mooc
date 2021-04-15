import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/controllers/signUpController.dart';
import 'package:mooc/tools/customWidget.dart';
import 'package:mooc/tools/formValidation.dart';
import 'package:mooc/tools/strings.dart';
import 'package:mooc/tools/utils.dart';

class SignUpView extends StatelessWidget {
  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _buildBody(),
      bottomNavigationBar: Obx(
        () => buildRoundedButton(
            color: Colors.green,
            radius: 0,
            onTap: signUpController.isLoading.value
                ? null
                : () => signUpController.signUp(),
            text: Center(
                child: signUpController.isLoading.value
                    ? CircularProgressIndicator(backgroundColor: Colors.white)
                    : Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ))),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: signUpController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText('Name', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              buildTextFormField(
                  controller: signUpController.nameController,
                  hintText: 'Name',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              buildText('Email', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              buildTextFormField(
                  controller: signUpController.emailController,
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
                  controller: signUpController.phoneController,
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
                    controller: signUpController.passwordController,
                    validator: (value) => validationPassword(value),
                    suffixIcon: InkWell(
                      onTap: () => signUpController.obscureText.toggle(),
                      child: Icon(
                        signUpController.obscureText.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    obscureText: signUpController.obscureText.value,
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
              buildText('Role', Colors.black, 16),
              SizedBox(
                height: 8,
              ),
              _buildRoleDropDown(),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleDropDown() {
    return Container(
        height: 50,
        padding: EdgeInsets.only(right: 16, left: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: Obx(
          () => DropdownButton<String>(
            hint: buildText('Student', Colors.black, 18),
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            isExpanded: true,
            value: signUpController.selectedRole.value,
            onChanged: (String value) {
              signUpController.selectedRole.value = value;
              FocusScope.of(Get.context).requestFocus(FocusNode());
            },
            items: signUpController.roles.map((String value) {
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
            value: signUpController.selectedMedium.value,
            onChanged: (String value) {
              signUpController.selectedMedium.value = value;
              FocusScope.of(Get.context).requestFocus(FocusNode());
            },
            items: signUpController.mediums.map((String value) {
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
