import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/classes/statusRequest.dart';
import '../../core/constants/appRoutesNames.dart';
import '../../core/functions/handlingData.dart';
import '../../core/services/services.dart';
import '../../data/dataSource/remote/address_data.dart';

abstract class AddAddressDetailsController extends GetxController {
  initialData();
  addAddress();
}

class AddAddressDetailsControllerImp extends AddAddressDetailsController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;

  @override
  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  @override
  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);

   // print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homePage);
      } else {
        statusRequest = StatusRequest.serverFailure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
