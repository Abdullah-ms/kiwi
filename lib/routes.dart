import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import 'package:kiwi/view/screens/OnBoardingScreen.dart';
import 'package:kiwi/view/screens/address/add.dart';
import 'package:kiwi/view/screens/address/addAddressDetails.dart';
import 'package:kiwi/view/screens/address/view.dart';
import 'package:kiwi/view/screens/auth/forgetPassword/forgetPassword.dart';
import 'package:kiwi/view/screens/auth/login.dart';
import 'package:kiwi/view/screens/auth/forgetPassword/resetPassword.dart';
import 'package:kiwi/view/screens/auth/signUp.dart';
import 'package:kiwi/view/screens/auth/success_SignUp.dart';
import 'package:kiwi/view/screens/auth/forgetPassword/success_reset.dart';
import 'package:kiwi/view/screens/auth/forgetPassword/verifyCode.dart';
import 'package:kiwi/view/screens/auth/verifyCodeSignUp.dart';
import 'package:kiwi/view/screens/cart.dart';
import 'package:kiwi/view/screens/checkOut.dart';
import 'package:kiwi/view/screens/homeScreen.dart';
import 'package:kiwi/view/screens/items.dart';
import 'package:kiwi/view/screens/language.dart';
import 'package:kiwi/view/screens/myFavorite.dart';
import 'package:kiwi/view/screens/products.dart';
import 'package:kiwi/view/test_view.dart';
import 'core/middleware/middlewareOne.dart';

List<GetPage<dynamic>>? myGetPages = [
   GetPage( name: "/", page: () => const Language(), middlewares: [MiddleWareOne()]),
  // GetPage(name: "/", page: () => const CheckOut()),
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  //Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successReset, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoutes.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
  GetPage(name: AppRoutes.products, page: () => const Products()),
  GetPage(name: AppRoutes.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoutes.cart, page: () => const Cart()),

  GetPage(name: AppRoutes.addressView, page: () => const AddressView()),
  GetPage(name: AppRoutes.addressAdd, page: () => const AddressAdd()),
  GetPage(name: AppRoutes.addressAddDetails, page: () => const AddressDetails()),

  GetPage(name: AppRoutes.checkOut, page: () => const CheckOut()),
];
