import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import '../../../controller/address/address_view_controller.dart';
import '../../../core/classes/handlingDataView.dart';
import '../../../core/constants/colors.dart';
import '../../../data/model/addressModel.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewControllerImp controller = Get.put(AddressViewControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('address'),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              Get.toNamed(AppRoutes.addressAdd);
            },
            child: Icon(Icons.add , color: AppColors.white, )),
        body: GetBuilder<AddressViewControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, i) {
                  return CardAddress(
                    addressModel: controller.data[i],
                    onDelete: () {
                      controller.deleteAddress(controller.data[i].addressId!.toString());
                    },
                  );
                },
              ),
            ),
          ),
        ));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({Key? key, required this.addressModel, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Row(
              children: [
                const Icon(Icons.location_on_outlined , color: Colors.blue ,),
                const SizedBox(width: 10,),
                Text(addressModel.addressName!),
              ],
            ),
            subtitle: Text(
                "${addressModel.addressCity!}  /  ${addressModel.addressStreet}"),
            trailing: IconButton(
                onPressed: onDelete, icon: const Icon(Icons.delete_outline , color: Colors.red,)),
          )),
    );
  }
}
