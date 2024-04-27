import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/classes/statusRequest.dart';
import '../core/constants/colors.dart';
import '../core/functions/handlingData.dart';
import '../core/services/services.dart';
import '../data/dataSource/remote/favorite_data.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(id, val);

  addFavorite(String itemId);

  removeFavorite(String itemId);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};

  FavoriteData favoriteData = FavoriteData(Get.find());

  // ال MyServices معمول له حقن لذلك فقط نعمل find
  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  @override
  addFavorite(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addFavoriteData(
        // ال itemId سيتم ارساله من صفحة ال items عند الضغط على زر المفضلة
        myServices.sharedPreferences.getString("id")!,
        itemId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
          title: "Alert",
          messageText: Text(
            "Added to favorites",
            style: TextStyle(color: AppColors.white),
          ),
        );
      } else {
        // الخطأ كان انك مستخدم == وليس = وبالتالي تكون مقارنة وليس اسناد قيمة في حال ال statusRequest = StatusRequest.noData;
        statusRequest = StatusRequest.noData;
      }
    }
    // لا احتاج عمل update لانه لا يوجد تحديث لل UI
    // update();
  }

  @override
  removeFavorite(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.removeFavoriteData(
        myServices.sharedPreferences.getString("id")!, itemId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
          title: "Alert",
          messageText: Text(
            "Canceled from favorites",
            style: TextStyle(color: AppColors.white),
          ),
        );
      } else {
        // الخطأ كان انك مستخدم == وليس = وبالتالي تكون مقارنة وليس اسناد قيمة في حال ال statusRequest = StatusRequest.noData;
        statusRequest = StatusRequest.noData;
      }
    }
    // لا احتاج عمل update لانه لا يوجد تحديث لل UI
    // update();
  }
}
