import 'package:get/get.dart';
import 'package:kiwi/core/classes/statusRequest.dart';
import '../core/functions/handlingData.dart';
import '../core/services/services.dart';
import '../data/dataSource/remote/address_data.dart';
import '../data/model/addressModel.dart';

abstract class CheckoutController extends GetxController {
  choosePaymentMethod(String val);

  chooseReceiveType(String val);

  chooseDeliveryAddress(String val);

  getAddressId();
}

class CheckoutControllerImp extends CheckoutController {
  AddressData addressData = Get.put(AddressData(Get.find()));

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  List<AddressModel> dataAddress = [];

  String? paymentMethod;

  String? receiveType;

  String? addressId;

  @override
  choosePaymentMethod(val) {
    paymentMethod = val;
    update();
  }

  @override
  chooseReceiveType(val) {
    receiveType = val;
    update();
  }

  @override
  chooseDeliveryAddress(val) {
    addressId = val;
    update();
  }

  @override
  getAddressId() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response['data'];
        dataAddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        // الخطأ كان انك مستخدم == وليس = وبالتالي تكون مقارنة وليس اسناد قيمة في حال ال statusRequest = StatusRequest.noData;
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    getAddressId();
    super.onInit();
  }
}
