import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import '../../../../controller/auth/resetPassword_controller.dart';
import '../../../../core/classes/statusRequest.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/functions/validInput.dart';
import '../../../widgets/auth/customButtonAuth.dart';
import '../../../widgets/auth/customTextFormField.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "Reset Password",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColors.blackIntermediate),
            )),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controllerImp) => HandlingDataRequest(statusRequest: controllerImp.statusRequest, widget: Container(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
            child: Form(
              key: controllerImp.formState,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'New Password',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: AppColors.black),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'please enter a new password',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GetBuilder<ResetPasswordControllerImp>(
                      builder: (controller) => CustomTextFormField(
                          obscureText: controller.isShowPassword,
                          onTapIcon: () {
                            controller.showingPassword();
                          },
                          isNumber: false,
                          label: 'Password',
                          hintText: 'enter your password',
                          iconData: controller.isShowPassword == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          myController: controllerImp.password,
                          myValidator: (val) {
                            return validInput(val!, 25, 4, "password");
                          })),
                  GetBuilder<ResetPasswordControllerImp>(
                      builder: (controller) => CustomTextFormField(
                          obscureText: controller.isShowPassword,
                          onTapIcon: () {
                            controller.showingPassword();
                          },
                          isNumber: false,
                          label: 'Password',
                          hintText: 're_enter your password',
                          iconData: controller.isShowPassword == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          myController: controllerImp.rePassword,
                          myValidator: (val) {
                            return validInput(val!, 25, 4, "password");
                          })),
                  CustomAuthButton(
                    textButton: 'Save',
                    onPressed: () {
                      controllerImp.goToSuccessResetPassword();
                    },
                  ),
                ],
              ),
            ),
          ),)
        ));
  }
}
