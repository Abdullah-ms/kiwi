import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
 late String verifyCode ;

  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  @override
  checkCode() {

  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

}