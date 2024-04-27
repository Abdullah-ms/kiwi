import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import '../core/services/services.dart';

abstract class SettingController extends GetxController {
  logOut();
}

class SettingControllerImp extends SettingController {
  // ال MyServices معمول له حقن لذلك فقط نعمل find
  MyServices myServices = Get.find();

  @override
  logOut() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
