 import 'package:get/get.dart';
import 'package:kiwi/data/model/itemsModel.dart';

abstract class ProductController extends GetxController{
  initialData();
}

class ProductControllerImp extends ProductController{

  late ItemsModel itemsModel ;

  @override
  initialData() {
    itemsModel = Get.arguments["itemsModel"];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

}