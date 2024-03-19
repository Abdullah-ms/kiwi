import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/successSignUp_controller.dart';
import '../../../core/constants/colors.dart';
import '../../widgets/auth/customButtonAuth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controllerImp = Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Success SignUp",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.blackIntermediate),
          )),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 50,
              color: AppColors.primaryColor,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Congratulations",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "your account has been created successfully",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomAuthButton(
                textButton: 'Go to login',
                onPressed: () {
                  controllerImp.goToLogin();
                },
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
