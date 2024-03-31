import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/statusRequest.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

import '../../core/functions/handlingData.dart';
import '../../data/dataSource/remote/auth/login_data.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;

  late TextEditingController password;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isShowPassword = true;

  showingPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  login() async {
    FormState? formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.getLoginData(
          email.text, password.text);
      print("==============this is login to homepage function ========================== controller $response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.homePage);
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Incorrect email or password");
          statusRequest = StatusRequest.noData;
        }
      }
      update();
    } else {

    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
