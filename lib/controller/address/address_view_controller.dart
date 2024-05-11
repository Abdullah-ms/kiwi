import 'package:get/get.dart';
import '../../core/classes/statusRequest.dart';
import '../../core/functions/handlingData.dart';
import '../../core/services/services.dart';
import '../../data/dataSource/remote/address_data.dart';
import '../../data/model/addressModel.dart';

abstract class AddressViewController extends GetxController {
  deleteAddress(String addressid);
  getData();
}

class AddressViewControllerImp extends AddressViewController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  deleteAddress(addressid) {
    addressData.deleteData(addressid);
    // اضفت toString هنا
    data.removeWhere((element) => element.addressId.toString() == addressid);
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

  //  print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty){
          statusRequest = StatusRequest.noData ;
        }
      } else {
        statusRequest = StatusRequest.noData;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}