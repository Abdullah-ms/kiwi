import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToSuccessResetPassword();
  goToLogin();
}

class ResetPasswordControllerImp extends ResetPasswordController {

  late TextEditingController password ;
  late TextEditingController repassword ;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isShowPassword = true ;
  showingPassword(){
    isShowPassword = isShowPassword == true ? false : true ;
    update();
  }


  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoutes.successReset);
  }


  @override
  goToLogin() {
    // Get.offNamed(AppRoutes.login);
  }

  @override
  resetPassword() {
    var formData = formState.currentState;
    if(formData!.validate()){
      Get.offNamed(AppRoutes.successReset);
    }else{

    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

}