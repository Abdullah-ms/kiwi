import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {

  late TextEditingController username ;
  late TextEditingController email ;
  late TextEditingController phone ;
  late TextEditingController password ;

  GlobalKey<FormState> formState = GlobalKey<FormState>() ;

  bool isShowPassword = true;

  showingPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  signUp() {
    FormState? formData = formState.currentState ;
    if(formData!.validate()) {
      Get.offNamed(AppRoutes.verifyCodeSignUp);
    }else{

    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

}