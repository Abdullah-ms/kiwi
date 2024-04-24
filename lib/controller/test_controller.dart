import 'package:get/get.dart';
import 'package:kiwi/core/classes/statusRequest.dart';
import 'package:kiwi/data/dataSource/remote/test_data.dart';
import '../core/functions/handlingData.dart';

abstract class TestController extends GetxController {
  getMyData();
}

class TestControllerImp extends TestController {
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  @override
  getMyData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getTestData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest ) {
      if (response["status"] == "success") {
        print("======================================== status : success");
        print(response);
        data.addAll(response['data']);
      } else {
        // الخطأ كان انك مستخدم == وليس = وبالتالي تكون مقارنة وليس اسناد قيمة في حال ال statusRequest = StatusRequest.noData;
         statusRequest = StatusRequest.noData;
        print("======================================== status : failure");
        print(response);
        print("$statusRequest but no data found");
      }
    }
    update();
  }

  @override
  void onInit() {
    getMyData();
    super.onInit();
  }
}
