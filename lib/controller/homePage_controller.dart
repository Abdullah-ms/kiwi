import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import 'package:kiwi/core/services/services.dart';
import 'package:kiwi/data/model/itemsModel.dart';
import 'package:lottie/lottie.dart';
import '../core/classes/statusRequest.dart';
import '../core/constants/assetsImages.dart';
import '../core/functions/handlingData.dart';
import '../data/dataSource/remote/home_data.dart';

abstract class HomeController extends SearchMixController {
  getData();

  goToItems(List categories, int selectedCat);

  initialData();

  goToMyFavorite();

  goToProducts(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeController {
  // ال MyServices معمول له حقن لذلك فقط نعمل find
  MyServices myServices = Get.find();
  String? lang;

  HomeData homeData = HomeData(Get.find());

  List dataCategories = [];
  List dataItems = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getHomeData();
    // print("===================================================== $response") ;
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        dataCategories.addAll(response['categories']['data']);
        dataItems.addAll(response['items']['data']);
      } else {
        // الخطأ كان انك مستخدم == وليس = وبالتالي تكون مقارنة وليس اسناد قيمة في حال ال statusRequest = StatusRequest.noData;
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  goToItems(categories, selectedCat) {
    Get.toNamed(AppRoutes.items,
        arguments: {"categories": categories, "selectedCat": selectedCat});
  }

  @override
  goToMyFavorite() {
    Get.toNamed(AppRoutes.myFavorite);
  }

  @override
  goToProducts(itemsModel) {
    Get.toNamed(AppRoutes.products, arguments: {
      "itemsModel": itemsModel,
    });
  }
}

class SearchMixController extends GetxController {
  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequest;

  List<ItemsModel> searchItemsList = [];

  TextEditingController? search;

  bool isSearch = false;

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onPressSearchButton() {
    if(search!.text.isEmpty){
      isSearch = false;
    }else{
      isSearch = true;
      searchItems();
    }
    update();
  }


  searchItems() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getSearchData(search!.text);
    // print("===================================================== $response") ;
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        searchItemsList.clear();
        List responseData = response["data"];
        searchItemsList.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        // الخطأ كان انك مستخدم == وليس = وبالتالي تكون مقارنة وليس اسناد قيمة في حال ال statusRequest = StatusRequest.noData;
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }
}
