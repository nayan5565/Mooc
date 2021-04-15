import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mooc/models/mSignUp.dart';
import 'package:mooc/tools/customWidget.dart';

class IntroductionView extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: 10),
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: "",
            bodyWidget: Column(children: [
              _buildImage('img'),
              Text(
                'keep hearts',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tap on option to give answer and Make choice the correct answer to keep heart',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ]),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "",
            // body:
            //     "Check button enable when give answer",
            bodyWidget: Column(children: [
              _buildImage('img2'),
              Text(
                'Select answer',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Check button enable when give answer',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ]),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "",
            bodyWidget: Column(children: [
              _buildImage('img3'),
              Text(
                'Makes correct translate',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tap on bottom option for making a sentence',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ]),
            decoration: pageDecoration,
          ),
        ],
        // onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: false,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text(
          'Skip',
          style: TextStyle(fontSize: 18),
        ),
        next: const Icon(
          Icons.arrow_forward,
          size: 32,
        ),
        showDoneButton: false,
        showNextButton: false,
        // done: const Text('Done',
        //     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),

      ),
    );
  }

  Widget _buildImage(String assetName) {
    return Center(
      child: Image.asset(
        'assets/icons/facebook.png',
        width: Get.width,
        height: Get.height * 0.6,
      ),
    );
  }
}
