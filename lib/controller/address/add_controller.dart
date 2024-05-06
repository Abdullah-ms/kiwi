import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/classes/statusRequest.dart';

abstract class AddAddressController extends GetxController {

}

class AddAddressControllerImp extends AddAddressController {

  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? mapController ;

  Position? position;

  CameraPosition? kGooglePlex ;

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

@override
  void onInit() {
  getCurrentLocation();
  mapController = Completer<GoogleMapController>();
    super.onInit();
  }
}