import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/test_controller.dart';
import '../core/classes/handlingDataView.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test View"),
      ),
      body: GetBuilder<TestControllerImp>(builder: (controllerImp) {
        return HandlingDataView(
          statusRequest: controllerImp.statusRequest,
          widget: ListView.builder(
              itemCount: controllerImp.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text("${controllerImp.data}"),
                  ],
                );
              }),
        );
      }),
    );
  }
}
