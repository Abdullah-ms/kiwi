import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import 'package:kiwi/core/constants/colors.dart';

import '../../../controller/address/add_controller.dart';


class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressControllerImp controllerImp = Get.put(AddAddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add new address",
        ),
      ),
      body: Container(
        child: GetBuilder<AddAddressControllerImp>(
          builder: (controllerImp) => HandlingDataView(
            statusRequest: controllerImp.statusRequest,
            widget: Column(
              children: [
                if(controllerImp.kGooglePlex != null ) Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: controllerImp.markers.toSet() ,
                        onTap: (latLng){
                          controllerImp.addMarkers(latLng);
                        },
                        initialCameraPosition: controllerImp.kGooglePlex!,
                        onMapCreated: (GoogleMapController mapController) {
                          controllerImp.mapController!.complete(mapController);
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          child: MaterialButton(
                            minWidth: 200,
                            onPressed: () {
                              controllerImp.goToPageAddDetailsAddress();
                            },
                            color: AppColors.primaryColor,
                            textColor: Colors.white,
                            child:
                            const Text("Add address", style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ),
                    ],
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
