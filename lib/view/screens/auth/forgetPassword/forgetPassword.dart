import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import 'package:kiwi/core/classes/statusRequest.dart';
import '../../../../controller/auth/forgetPassword_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/functions/validInput.dart';
import '../../../widgets/auth/customButtonAuth.dart';
import '../../../widgets/auth/customTextFormField.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "Forget Password",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColors.blackIntermediate),
            )),
        body: GetBuilder<ForgetPasswordControllerImp>(
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
                    'Check your email',
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
                    'please enter your email address to receive a verification code',
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
                        return validInput(val!, 50, 6, "email");
                      }),
                  CustomAuthButton(
                    textButton: 'Check',
                    onPressed: () {
                      controllerImp.checkEmail();
                    },
                  ),
                ],
              ),
            ),
          ),)
        ));
  }
}
