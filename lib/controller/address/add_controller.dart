import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/classes/statusRequest.dart';
import '../../core/constants/appRoutesNames.dart';

abstract class AddAddressController extends GetxController {
  addMarkers(LatLng latLng);
  goToPageAddDetailsAddress();
  getCurrentLocation();
}

class AddAddressControllerImp extends AddAddressController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? mapController;

  Position? position;
  CameraPosition? kGooglePlex;

  List<Marker> markers = [];

  double? lat;
  double? long;

  @override
  addMarkers(latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  @override
  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoutes.addressAddDetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  @override
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
