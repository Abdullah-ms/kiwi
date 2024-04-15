import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import '../core/classes/statusRequest.dart';
import '../core/functions/handlingData.dart';
import '../data/dataSource/remote/home_data.dart';

abstract class HomeController extends GetxController {
  getData();
  goToItems(List categories , int selectedCat);
}

class HomeControllerImp extends HomeController {

  HomeData homeData = HomeData(Get.find());

  List dataCategories = [];
  List dataItems = [];

  late StatusRequest statusRequest;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getHomeData();
    print("===================================================== $response") ;
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        dataCategories.addAll(response['categories']);
        dataItems.addAll(response['items']);
      } else {
        statusRequest == StatusRequest.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  goToItems(categories , selectedCat) {
    Get.toNamed(AppRoutes.items , arguments : {
      "categories" : categories ,
      "selectedCat" :  selectedCat
    });
  }


}