import 'package:get/get.dart';
import 'package:mooc/models/mConfirmationCodeValidity.dart';
import 'package:mooc/models/mResponseBody.dart';
import 'package:mooc/models/mVerifyStatus.dart';
import 'package:mooc/network/apiCall.dart';
import 'package:mooc/tools/utils.dart';
import 'package:mooc/views/addRecoveryEmail/addRecoveryEmailView.dart';

import 'authController.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.find();
  final cIndex = 0.obs;

  String getEmail() {
    return authController.mUser.value.data.myEmail;
  }

  changeScreen(int index) {
    cIndex.value = index;
    switch (cIndex.value) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        Get.to(() => AddRecoveryEmailView());
        break;
      case 3:
        confirmCodeValidity('nayan@gmail.com', '+8801629683564', 'phone');
        break;
      case 4:
        verifiedStatus('nayan@gmail.com', '+8801629683563', 'phone');
        break;
    }
  }

  verifiedStatus(String email, String phone, String medium) async {
    MVerifyStatus mVerifyStatus =
        await verifiedStatusApi(phone: phone, email: email, medium: medium);
    if (!mVerifyStatus.error)
      showToast(mVerifyStatus.message);
    else
      showToast(mVerifyStatus.message);
  }

  confirmCodeValidity(String email, String phone, String medium) async {
    MConfirmationCodeValidity mConfirmationCodeValidity =
        await confirmationCodeValidityApi(
            phone: phone, email: email, medium: medium);
    if (!mConfirmationCodeValidity.error)
      showToast(mConfirmationCodeValidity.message);
    else
      showToast(mConfirmationCodeValidity.message);
  }
}
