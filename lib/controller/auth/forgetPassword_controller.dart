import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {

  late TextEditingController email ;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  goToVerifyCode() {
    // Get.offNamed(AppRoutes.verifyCode);
  }

  @override
  checkEmail() {
    FormState? formData = formState.currentState ;
    if(formData!.validate()){
      Get.offNamed(AppRoutes.verifyCode);
    }else{

    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}