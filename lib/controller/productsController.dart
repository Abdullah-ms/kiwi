import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import 'package:kiwi/data/model/itemsModel.dart';

import '../core/classes/statusRequest.dart';
import '../core/functions/handlingData.dart';
import '../core/services/services.dart';
import '../data/dataSource/remote/cart_data.dart';
import 'cart_controller.dart';

abstract class ProductController extends GetxController {
  initialData();

  getCountItems(String itemId);

  addItem(String itemId);

  deleteItem(String itemId);

  increaseCount();

  decreaseCount();

  goToCart();
}

class ProductControllerImp extends ProductController {
  // تم الغاء كونترولر الكارت لانه عند حقنه سيشغل ال onInit بشكل افتراضي ..يعني سيجلب كل بيانات السلة ونحن لازلنا بصفحة المنتجات وهذا يعمل ركوست اضافي ويبطىء التطبيق
  // CartControllerImp cartController = Get.put(CartControllerImp());

  late ItemsModel itemsModel;

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  // ال MyServices معمول له حقن لذلك فقط نعمل find
  MyServices myServices = Get.find();

  int countOfAddItems = 0;

  // تم اتدعاء ال getCountItems في صفحة الproduct لارسال ال itemsId لان الcardController محقون مسبقاً

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    // lang = myServices.sharedPreferences.getString("lang");
    itemsModel = Get.arguments["itemsModel"];
    countOfAddItems = await getCountItems(itemsModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  List subItemsList = [
    {
      "name": "Smokey",
      "id": 1,
      "active": 0,
    },
    {
      "name": "Spicy",
      "id": 1,
      "active": 1,
    },
    {
      "name": "Original",
      "id": 1,
      "active": 0,
    },
  ];

  @override
  getCountItems(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCountCartData(
        myServices.sharedPreferences.getString("id")!, itemId);
    // print("===================================================== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        int countOfItems = 0;
        countOfItems = response['data'];
        return countOfItems;
        print(
            "===================================================== $countOfItems");
      } else {
        // الخطأ كان انك مستخدم == وليس = وبالتالي تكون مقارنة وليس اسناد قيمة في حال ال statusRequest = StatusRequest.noData;
        statusRequest = StatusRequest.noData;
      }
    }
  }

  @override
  addItem(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCartData(
        myServices.sharedPreferences.getString("id")!, itemId);
    // print("===================================================== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
/*        Get.rawSnackbar(
          title: "Alert",
          messageText: Text(
            "Added to Cart",
            style: TextStyle(color: AppColors.white),
          ),
        );*/
      } else {
        // الخطأ كان انك مستخدم == وليس = وبالتالي تكون مقارنة وليس اسناد قيمة في حال ال statusRequest = StatusRequest.noData;
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  deleteItem(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCartData(
        myServices.sharedPreferences.getString("id")!, itemId);
    // print("===================================================== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
/*        Get.rawSnackbar(
          title: "Alert",
          messageText: Text(
            "Deleted from Cart",
            style: TextStyle(color: AppColors.white),
          ),
        ); */
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  increaseCount() {
    addItem(itemsModel.itemsId.toString());
    countOfAddItems++;
    update();
  }

  @override
  decreaseCount() {
    if (countOfAddItems > 0) {
      deleteItem(itemsModel.itemsId.toString());
      countOfAddItems--;
      update();
    }
  }

  @override
  goToCart() {
    Get.toNamed(AppRoutes.cart);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
