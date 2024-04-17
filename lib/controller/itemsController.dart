import 'package:get/get.dart';

import '../core/classes/statusRequest.dart';
import '../core/functions/handlingData.dart';
import '../data/dataSource/remote/items_data.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int newCat);
  getData(int requestCatId);
}

class ItemsControllerImp extends ItemsController {

  List categories = [] ;
  int? selectedCat ;

  ItemsData itemsData = ItemsData(Get.find());

  List itemsList = [];

  late StatusRequest statusRequest;

  @override
  getData(requestCatId) async {
    /*
    لضمان افراغ الlist عند الانتقال من قسم لاخر لانه لو لم يتم مسح البيانات لاضيفت
    فوق بعضها وظهرت منتجات القسم السابق مع القسم الحالي
     */
    itemsList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getItemsData(requestCatId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest ) {
      if (response["status"] == "success") {
        itemsList.addAll(response['data']);
      } else {
        statusRequest == StatusRequest.noData;
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
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    /*
     الselectedCat يبدأ من ال0 لانه رقم index للlist ونحن مستخدمينه بوظيفتين هما اولا يتحكم بظهور الخط تحت القسم وهنا يبدأ من ال0 لانه يمثل list
     بينما بالوظيفة الثانية وهي انه يتم ارساله ك request فهو يجب ان يزيد بمقدار 1 لانه id الاقسام يبدا من 1 بجدول قاعدة البيانات
     */
    getData(selectedCat!+1);
  }


  @override
  changeCat(newCat) {
    selectedCat = newCat ;
    getData(newCat+1);
    update();
  }

}