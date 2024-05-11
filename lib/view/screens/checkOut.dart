import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import '../../controller/checkout_controller.dart';
import '../../core/constants/assetsImages.dart';
import '../../core/constants/colors.dart';
import '../widgets/checkout/cardDeliveryAddress.dart';
import '../widgets/checkout/cardDeliveryType.dart';
import '../widgets/checkout/cardPaymentMethod.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: MaterialButton(
          color: AppColors.primaryColor,
          textColor: AppColors.white,
          onPressed: () {},
          child: const Text(
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      body: GetBuilder<CheckoutControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Text(
                  "Choose Payment Method",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      controller.choosePaymentMethod("cash");
                    },
                    child: CardPaymentMethodCheckout(
                      title: 'Cash',
                      isActive:
                          controller.paymentMethod == "cash" ? true : false,
                    )),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      controller.choosePaymentMethod("card");
                    },
                    child: CardPaymentMethodCheckout(
                      title: 'Payment cards',
                      isActive:
                          controller.paymentMethod == "card" ? true : false,
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                Text(
                  "Receive the order by",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        controller.chooseReceiveType("Delivery");
                      },
                      child: CardDeliveryType(
                        title: 'Delivery',
                        isActive: controller.receiveType == "Delivery" ? true : false ,
                        imageName: MyImages.delivery,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: (){
                        controller.chooseReceiveType("Drive");
                      },
                      child: CardDeliveryType(
                        title: 'Drive-thru',
                        isActive: controller.receiveType == "Drive" ? true : false ,
                        imageName: MyImages.drivethru,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              if(controller.receiveType == "Delivery")
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
             const Divider(),
             Text(
               "Choose Delivery address",
               style: TextStyle(
                   color: AppColors.primaryColor,
                   fontWeight: FontWeight.bold,
                   fontSize: 16),
             ),
             const SizedBox(
               height: 10,
             ),
             ...List.generate(controller.dataAddress.length, (index) => InkWell(
               onTap: (){
                 controller.chooseDeliveryAddress(controller.dataAddress[index].addressId.toString()) ;
               },
               child: CardDeliveryAddress(
                 title: "${controller.dataAddress[index].addressName}",
                 subtitle: "${controller.dataAddress[index].addressCity} / ${controller.dataAddress[index].addressStreet}",
                 isActive: controller.addressId == controller.dataAddress[index].addressId.toString() ? true : false,
               ),
             ),)
           ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
