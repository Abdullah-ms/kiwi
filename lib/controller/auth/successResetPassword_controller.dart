import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

abstract class SuccessResetPasswordController extends GetxController{
  goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

}