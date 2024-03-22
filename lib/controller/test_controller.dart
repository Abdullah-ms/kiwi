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
    print("==========controller==============");
    print(response);
    print("========================");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['success'] == "success"){
        data.addAll(response['data']);
      }else{
        statusRequest == StatusRequest.noData ;
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
