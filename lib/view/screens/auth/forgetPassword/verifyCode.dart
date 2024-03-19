import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/verfyCode_controller.dart';
import '../../../../core/constants/colors.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controllerImp = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Verification Code",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.blackIntermediate),
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Check code',
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
              'please enter the digits code sent to example@gmail.com',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            OtpTextField(

              numberOfFields: 5,
              borderColor: AppColors.primaryColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                controllerImp.goToResetPassword();
              }, // end onSubmit
            ),

          ],
        ),
      ),
    );
  }
}
