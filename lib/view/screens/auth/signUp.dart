import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/statusRequest.dart';
import 'package:kiwi/core/functions/validInput.dart';
import '../../../controller/auth/signUp_controller.dart';
import '../../../core/classes/handlingDataView.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/alertExitApp.dart';
import '../../widgets/auth/customButtonAuth.dart';
import '../../widgets/auth/customTextFormField.dart';
import '../../widgets/auth/customTextSignInOrSignUp.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "Sign Up",
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
          child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 35),
                      child: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 40,
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
                                label: 'Username',
                                hintText: 'enter your username',
                                iconData: Icons.person_outline,
                                myController: controller.username,
                                myValidator: (val) {
                                  // تم تغيير النوع وجعله يقبل الnull لكي يقبل اكثر من كلمة
                                  return validInput(val!, 50, 4,null);
                                }),
                            CustomTextFormField(
                                isNumber: false,
                                label: 'Email',
                                hintText: 'enter your email',
                                iconData: Icons.mail_outline,
                                myController: controller.email,
                                myValidator: (val) {
                                  return validInput(val!, 50, 6, "email");
                                }),
                            CustomTextFormField(
                                isNumber: true,
                                label: 'Phone',
                                hintText: 'enter your phone',
                                iconData: Icons.phone_android_outlined,
                                myController: controller.phone,
                                myValidator: (val) {
                                  return validInput(val!, 20, 10, "phone");
                                }),
                            GetBuilder<SignUpControllerImp>(
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
                                  myController: controller.password,
                                  myValidator: (val) {
                                    return validInput(val!, 25, 4, "password");
                                  }),
                            ),
                            CustomAuthButton(
                              textButton: 'Sign Up',
                              onPressed: () {
                                controller.signUp();
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextSignInOrSignUp(
                              textOne: "I have an account  ",
                              textTwo: ' Login',
                              onTap: () {
                                controller.goToLogin();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
