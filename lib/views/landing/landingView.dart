import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/tools/customWidget.dart';
import 'package:mooc/views/signIn/signInView.dart';
import 'package:mooc/views/signUp/signUpView.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        elevation: 0,
        title: buildText('Sign in', Colors.white, 32),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          _buildEmailButton(),
          SizedBox(
            height: 48,
          ),
          _buildDivider(),
          SizedBox(
            height: 48,
          ),
          _buildGoogleButton(),
          SizedBox(
            height: 12,
          ),
          _buildFacebookButton(),
          Expanded(
            child: SizedBox(),
          ),
          _buildNewCreate(),
          Expanded(
            child: SizedBox(),
          ),
          _buildTermsCondition(),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget _buildEmailButton() {
    return buildRoundedButton(
        onTap: () => Get.to(() => SignInView()),
        color: Colors.white,
        radius: 0,
        text: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.email_sharp,
              color: Colors.red,
            ),
            SizedBox(
              width: 20,
            ),
            buildText('Sign in with email', Colors.black, 16)
          ],
        ));
  }

  Widget _buildGoogleButton() {
    return buildRoundedButton(
        color: Colors.white,
        radius: 0,
        text: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/google.png',
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 20,
            ),
            buildText('Sign in with Google', Colors.black, 16)
          ],
        ));
  }

  Widget _buildFacebookButton() {
    return buildRoundedButton(
        onTap: () => Get.to(SignInView()),
        color: Colors.white,
        radius: 0,
        text: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/facebook.png',
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 20,
            ),
            buildText('Sign in with Facebook', Colors.black, 16)
          ],
        ));
  }

  Widget _buildDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Divider(
          color: Colors.white,
        )),
        buildText('  or  ', Colors.white, 16),
        Expanded(
            child: Divider(
          color: Colors.white,
        )),
      ],
    );
  }

  Widget _buildNewCreate() {
    return TextButton(
        onPressed: () => Get.to(() => SignUpView()),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildText('New here?', Colors.white, 16),
            buildText(' Create an account', Colors.white, 16,
                fontWeight: FontWeight.bold)
          ],
        ));
  }

  Widget _buildTermsCondition() {
    return TextButton(
        onPressed: () => Get.to(() => SignUpView()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildText('By using our services you are agreeing to our',
                Colors.white, 14),
            buildText(' Terms and Privacy Statement', Colors.white, 16,
                fontWeight: FontWeight.bold)
          ],
        ));
  }
}
