import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/statusRequest.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import 'package:kiwi/core/functions/handlingData.dart';

import '../../data/dataSource/remote/auth/signUp_data.dart';

abstract class SignUpController extends GetxController {
  signUp();

  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;

  late TextEditingController email;

  late TextEditingController phone;

  late TextEditingController password;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isShowPassword = true;

  showingPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  //----------------------
  SignUpData signUpData = SignUpData(Get.find());
  late StatusRequest statusRequest;

  List signUpDataList = [];

  //----------------------

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  signUp() async {
    FormState? formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signUpData.getSignUpData(
          username.text, email.text, phone.text, password.text);
      print("======================================== controller $response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          /*
        signUpDataList.addAll(response['data']);

    عند اضافة الداتا وهي اصلا غير موجودة بدالة insertData بل PHP يظهر error بالاسفل ولا ينتقل الى صفحة التحقق
    لانه اصلا لا يوجد مفتاح اسمه response['data']
E/flutter ( 4479): [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: type 'Null' is not a subtype of type 'Iterable<dynamic>'
E/flutter ( 4479): #0      SignUpControllerImp.signUp (package:kiwi/controller/auth/signUp_controller.dart:57:41)

         */
          Get.offNamed(AppRoutes.verifyCodeSignUp);
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "phone number or email already exist");
          statusRequest = StatusRequest.noData;
        }
      }
      update();
    } else {}
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
