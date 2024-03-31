import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

import '../../core/classes/statusRequest.dart';
import '../../core/functions/handlingData.dart';
import '../../data/dataSource/remote/auth/forgetPassword/verifyCode.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword(String verificationCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {

 String? email ;

 VerifyCodeForgetPasswordData verifyCodeForgetPasswordData = VerifyCodeForgetPasswordData(Get.find());
 StatusRequest statusRequest = StatusRequest.none;

  @override
  goToResetPassword(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postVerifyCodeForgetPasswordData(email! , verificationCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetPassword , arguments: {"email": email});
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
  checkCode() {

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