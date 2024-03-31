import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

import '../../core/classes/statusRequest.dart';
import '../../core/functions/handlingData.dart';
import '../../data/dataSource/remote/auth/forgetPassword/resetPassword_data.dart';

abstract class ResetPasswordController extends GetxController{
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {

  late TextEditingController password ;
  late TextEditingController rePassword ;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isShowPassword = true ;
  showingPassword(){
    isShowPassword = isShowPassword == true ? false : true ;
    update();
  }

  String? email ;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none ;


  @override
  goToSuccessResetPassword() async {

    if(password.text != rePassword.text){
     return Get.defaultDialog(
          title: "Warning",
          middleText: "password not matched");
    }

    var formData = formState.currentState;
    if(formData!.validate()){
      statusRequest = StatusRequest.loading;
      update();
        var response = await resetPasswordData.postResetPasswordData(
            email!, password.text);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoutes.successReset);
          } else {
            statusRequest = StatusRequest.noData;
          }
        }
        update();
    }else{
      Get.defaultDialog(
          title: "Warning",
          middleText: "Try again");
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

}