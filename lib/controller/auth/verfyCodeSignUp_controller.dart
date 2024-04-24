import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

import '../../core/classes/statusRequest.dart';
import '../../core/functions/handlingData.dart';
import '../../data/dataSource/remote/auth/verifyCodeSignUp.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  goToSuccessSignUp(String verificationCode);
  resendVerifyCode();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {

  String? email ;

  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToSuccessSignUp(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postVerifyCodeSignUpData(email! , verificationCode);
    print("==================== this is verify to success signup ==================== controller $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning",
            middleText: "Invalid Verify Code");
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  resendVerifyCode() {
    verifyCodeSignUpData.resendVerifyCodeSignUpData(email!);
  }

  @override
  void onInit() {
    // لاستقبال الايميل وخزنه في المتغير email
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

}