import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

abstract class SuccessSignUpController extends GetxController{
  goToLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

}