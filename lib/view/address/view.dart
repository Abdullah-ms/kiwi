import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';


class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Addresses",style: TextStyle(color: Colors.white),),),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
       Get.toNamed(AppRoutes.addressAdd);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: ListView(children: const [
          Text("Address view page")
        ],),
      ),
    );
  }
}
