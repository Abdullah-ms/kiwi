import 'package:get/get.dart';
import '../core/classes/statusRequest.dart';
import '../core/functions/handlingData.dart';
import '../core/services/services.dart';
import '../data/dataSource/remote/cart_data.dart';

abstract class CartController extends GetxController {
  addToCart(String itemId);

  deleteFromCart(String itemId);

  getCartData();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());

  // ال MyServices معمول له حقن لذلك فقط نعمل find
  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  List carlList = [];
  double priceOfAllMealsInCart = 0.0;

  int totalCountOfItemsInCart = 0;

  @override
  addToCart(itemId) async {
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
  deleteFromCart(itemId) async {
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

  // نستدعي الgetCountItems(){} في الproduct_controller لاننا اصلا يمكننا الوصول اليه وهو الصفحة التي نحتاج فيها ظهور الcount اولا

  @override
  getCartData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .getCartData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          carlList.addAll(response['datacart']['data']);
          // ال response هو string لذلك يتم تحويلة مباشرة الى int
          totalCountOfItemsInCart =
              int.parse(response['countprice']['totalcount']);
          // ال response هو int ولتحويل ال  intالى double يجب تحويلة الى string اولا
          priceOfAllMealsInCart =
              double.parse(response['countprice']['totalprice'].toString());
        }
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  resetVariableValues() {
    carlList.clear();
    priceOfAllMealsInCart = 0.0;
    totalCountOfItemsInCart = 0;
  }

  refreshPage() {
    resetVariableValues();
    getCartData();
  }

  @override
  void onInit() {
    getCartData();
    super.onInit();
  }
}
