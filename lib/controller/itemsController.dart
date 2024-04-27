import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import 'package:kiwi/core/services/services.dart';
import 'package:kiwi/data/model/itemsModel.dart';
import '../core/classes/statusRequest.dart';
import '../core/functions/handlingData.dart';
import '../data/dataSource/remote/items_data.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int newCat);
  getData(int requestCatId , String requestUserId);
  goToProducts(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {



  List categories = [] ;
  int? selectedCat ;
  late String userId ;

  ItemsData itemsData = ItemsData(Get.find());

  // ال MyServices معمول له حقن لذلك فقط نعمل find
  MyServices myServices = Get.find();
  List itemsList = [];

  late StatusRequest statusRequest;

  @override
  getData(requestCatId , requestUserId) async {
    /*
    لضمان افراغ الlist عند الانتقال من قسم لاخر لانه لو لم يتم مسح البيانات لاضيفت
    فوق بعضها وظهرت منتجات القسم السابق مع القسم الحالي
     */
    itemsList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getItemsData(requestCatId , requestUserId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest ) {
      if (response["status"] == "success") {
        itemsList.addAll(response['data']);
      } else {
        // الخطأ كان انك مستخدم == وليس = وبالتالي تكون مقارنة وليس اسناد قيمة في حال ال statusRequest = StatusRequest.noData;
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    userId = myServices.sharedPreferences.getString("id")!;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    /*
     الselectedCat يبدأ من ال0 لانه رقم index للlist ونحن مستخدمينه بوظيفتين هما اولا يتحكم بظهور الخط تحت القسم وهنا يبدأ من ال0 لانه يمثل list
     بينما بالوظيفة الثانية وهي انه يتم ارساله ك request فهو يجب ان يزيد بمقدار 1 لانه id الاقسام يبدا من 1 بجدول قاعدة البيانات
     */
    getData(selectedCat!+1 , userId );
  }


  @override
  changeCat(newCat) {
    selectedCat = newCat ;
    getData(newCat+1 , userId);
    update();
  }

  @override
  goToProducts(itemsModel) {
    Get.toNamed(AppRoutes.products , arguments: {
      "itemsModel" : itemsModel ,
    });
  }

}