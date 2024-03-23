import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/test_controller.dart';
import 'package:kiwi/core/constants/colors.dart';
import '../core/classes/handlingDataView.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("page title",style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.primaryColor,
      ),
      body: GetBuilder<TestControllerImp>(builder: (controllerImp) {
        return HandlingDataView(
          statusRequest: controllerImp.statusRequest,
          widget: ListView.builder(
              itemCount: controllerImp.data.length,
              itemBuilder: (context, index) {
                return Text("${controllerImp.data}");
              }),
        );
      }),
    );
  }
}
