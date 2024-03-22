import 'package:get/get.dart';
import 'package:kiwi/core/classes/crud.dart';
import 'controller/auth/signUp_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp() , fenix: true);
    Get.put(Crud());
  }
}