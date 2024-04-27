 import 'package:get/get.dart';
import 'package:kiwi/data/model/itemsModel.dart';

import '../core/services/services.dart';

abstract class ProductController extends GetxController{
  initialData();
}

class ProductControllerImp extends ProductController{

  late ItemsModel itemsModel ;

  // ال MyServices معمول له حقن لذلك فقط نعمل find
  MyServices myServices = Get.find();
  String? lang ;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    itemsModel = Get.arguments["itemsModel"];
  }

  List subItemsList = [
    {
      "name" : "Smokey" , "id" : 1 , "active" : 0 ,
    },
    {
      "name" : "Spicy" , "id" : 1 , "active" : 1 ,
    },
    {
      "name" : "Original" , "id" : 1 , "active" : 0 ,
    },
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

}