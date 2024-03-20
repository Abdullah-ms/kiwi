import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import 'package:kiwi/view/screens/OnBoardingScreen.dart';
import 'package:kiwi/view/screens/auth/forgetPassword/forgetPassword.dart';
import 'package:kiwi/view/screens/auth/login.dart';
import 'package:kiwi/view/screens/auth/forgetPassword/resetPassword.dart';
import 'package:kiwi/view/screens/auth/signUp.dart';
import 'package:kiwi/view/screens/auth/success_SignUp.dart';
import 'package:kiwi/view/screens/auth/forgetPassword/success_reset.dart';
import 'package:kiwi/view/screens/auth/forgetPassword/verifyCode.dart';
import 'package:kiwi/view/screens/auth/verifyCodeSignUp.dart';
import 'package:kiwi/view/screens/language.dart';
import 'core/middleware/middlewareOne.dart';

List<GetPage<dynamic>>? myGetPages = [
  GetPage(
      name: "/",
      page: () => const Language(),
      middlewares: [MiddleWareOne()]),
  // GetPage(name: "/", page: () => const Test()),
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  //Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.successReset, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
];
