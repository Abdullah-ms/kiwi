import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/alertExitApp.dart';
import '../../../core/functions/validInput.dart';
import '../../widgets/auth/customButtonAuth.dart';
import '../../widgets/auth/customTextFormField.dart';
import '../../widgets/auth/customTextSignInOrSignUp.dart';
import '../../widgets/auth/logoAuth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Sign In",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.blackIntermediate),
          )),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          alertExitApp();
        },
        child: GetBuilder<LoginControllerImp>(
          builder: (controllerImp) => HandlingDataRequest(
            statusRequest: controllerImp.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              child: Form(
                key: controllerImp.formState,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const LogoAuth(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Welcome back',
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
                      'Continue with your email and password or with social media',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                        isNumber: false,
                        label: 'Email',
                        hintText: 'enter your email',
                        iconData: Icons.mail_outline,
                        myController: controllerImp.email,
                        myValidator: (val) {
                          return validInput(val!, 50, 10, "email");
                        }),
                    GetBuilder<LoginControllerImp>(
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
                    InkWell(
                      onTap: () {
                        controllerImp.goToForgetPassword();
                      },
                      child: Text(
                        "Forget password ?",
                        textAlign: TextAlign.end,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    CustomAuthButton(
                      textButton: 'Sign In',
                      onPressed: () {
                        controllerImp.login();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextSignInOrSignUp(
                      textOne: "Don't have an account ? ",
                      textTwo: ' SignUp',
                      onTap: () {
                        controllerImp.goToSignUp();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
