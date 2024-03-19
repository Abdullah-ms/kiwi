import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import 'package:kiwi/core/services/services.dart';

class MiddleWareOne extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find<MyServices>();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onBoarding") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}
