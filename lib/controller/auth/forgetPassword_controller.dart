import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

import '../../core/classes/statusRequest.dart';
import '../../core/functions/handlingData.dart';
import '../../data/dataSource/remote/auth/forgetPassword/checkEmail_data.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkEmail() async {
    FormState? formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postCheckEmailData(email.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifyCode , arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "this email not found");
          statusRequest = StatusRequest.noData;
        }
      }
      update();
    } else {}
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
