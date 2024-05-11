import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import '../../../controller/address/add_details_controller.dart';
import '../../../core/shared/defaultCustomButton.dart';
import '../../widgets/auth/customTextFormField.dart';


class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsControllerImp controller =
    Get.put(AddAddressDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add address details",
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormField(
                      hintText: "Home , Company , Bank ...",
                      label: "Address name",
                      iconData: Icons.location_on_outlined,
                      myController: controller.name!,
                      myValidator: (val) {
                        if (val == "") {
                          return "* Required field";
                        }
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormField(
                      hintText: "karada",
                      label: "city",
                      iconData: Icons.location_city,
                      myController: controller.city!,
                      myValidator: (val) {
                        if (val == "") {
                          return "* Required field";
                        }
                        return null;
                      },
                      isNumber: false,),
                  CustomTextFormField(
                      hintText: "Arasat street",
                      label: "street",
                      iconData: Icons.streetview,
                      myController: controller.street!,
                      myValidator: (val) {
                        if (val == "") {
                          return "* Required field";
                        }
                        return null;
                      },
                      isNumber: false),
                  SharedCustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.addAddress() ;
                    },
                  )
                ]),),
          ),),
    );
  }
}
