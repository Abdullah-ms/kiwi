import 'package:get/get.dart';
import '../core/classes/statusRequest.dart';
import '../core/functions/handlingData.dart';
import '../core/services/services.dart';
import '../data/dataSource/remote/myFavorite_data.dart';

abstract class MyFavoriteController extends GetxController {
  getData();
}

class MyFavoriteControllerImp extends MyFavoriteController {

  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  MyServices myServices = Get.find();
  List myFavoriteList = [];
  late StatusRequest statusRequest ;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myFavoriteData
        .getMyFavoriteData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        myFavoriteList.addAll(response['data']);
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
}
