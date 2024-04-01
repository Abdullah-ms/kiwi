import 'package:get/get.dart';
import 'package:kiwi/core/services/services.dart';

abstract class HomeController extends GetxController {

}

class HomeControllerImp extends HomeController {

  MyServices myServices = Get.find();

  String? email ;

  initialData(){
    email = myServices.sharedPreferences.getString("email");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}