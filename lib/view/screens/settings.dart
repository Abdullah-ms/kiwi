import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/settings_controller.dart';
import 'package:kiwi/core/constants/assetsImages.dart';
import 'package:kiwi/core/constants/colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controllerImp = Get.put(SettingControllerImp());
    return Container(
      child: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 2,
              color: AppColors.thirdColor,
            ),
            Positioned(
              top: Get.width / 3,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100)),
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primaryColor,
                  backgroundImage: const AssetImage(MyImages.logo),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text("Disable Notifications"),
                  trailing: Switch(value: true, onChanged: (val) {}),
                ),
                Divider(color: AppColors.secondaryColor),
                const ListTile(
                  title: Text("Addresses"),
                  trailing: Icon(Icons.location_on_outlined),
                ),
                Divider(color: AppColors.secondaryColor),
                const ListTile(
                  title: Text("About us"),
                  trailing: Icon(Icons.info_outline),
                ),
                Divider(color: AppColors.secondaryColor),
                const ListTile(
                  title: Text("Contact us"),
                  trailing: Icon(Icons.support_agent_outlined),
                ),
                Divider(color: AppColors.secondaryColor),
                ListTile(
                  title: const Text("LogOut"),
                  trailing: const Icon(
                    Icons.exit_to_app_outlined,
                    color: Colors.red,
                  ),
                  onTap: () {
                    controllerImp.logOut();
                  },
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
