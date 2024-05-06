import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import '../../controller/address/add_controller.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressControllerImp controllerImp = Get.put(AddAddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add new address",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: GetBuilder<AddAddressControllerImp>(
          builder: (controllerImp) => HandlingDataView(
            statusRequest: controllerImp.statusRequest,
            widget: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: controllerImp.kGooglePlex!,
                    onMapCreated: (GoogleMapController mapController) {
                      controllerImp.mapController!.complete(mapController);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
