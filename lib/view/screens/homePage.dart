import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import 'package:kiwi/core/constants/colors.dart';
import 'package:kiwi/data/model/itemsModel.dart';
import 'package:kiwi/view/widgets/home/customHomeTitle.dart';
import '../../controller/homePage_controller.dart';
import '../../linkAPIs.dart';
import '../widgets/home/bannerCard.dart';
import '../widgets/customAppBar.dart';
import '../widgets/home/ListOfHomePageCategories.dart';
import '../widgets/home/listOfNewItems.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controllerImp) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: ListView(
          children: [
            CustomAppBar(
              titleAppBar: 'Find your meal...',
              onPressedSearch: () {
                controllerImp.onPressSearchButton();
              },
              onPressedNotification: () {},
              onPressedFavorite: () {
                controllerImp.goToMyFavorite();
              },
              myController: controllerImp.search,
              onChanged: (val) {
                controllerImp.checkSearch(val);
              }
            ),
            HandlingDataView(
                statusRequest: controllerImp.statusRequest,
                widget: controllerImp.isSearch == false
                    ? const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BannerCard(
                            title: 'Friday Offers',
                            subTitle: 'Discount +40%',
                          ),
                          CustomHomeTitle(title: "Categories"),
                          ListOfHomePageCategories(),
                          CustomHomeTitle(title: "Discount"),
                          ListOfNewItems(),
                          CustomHomeTitle(title: "Top Seals"),
                          ListOfNewItems(),
                        ],
                      )
                    : SearchPage(
                        comingSearchItems: controllerImp.searchItemsList,
                      )),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends GetView<HomeControllerImp> {
  final List<ItemsModel> comingSearchItems;

  const SearchPage({super.key, required this.comingSearchItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: comingSearchItems.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              // نمرر الـ comingSearchItems مع ال index لان صفحة المنتجات تستقبل منتج واحد في كل مرة
              controller.goToProducts(comingSearchItems[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 3),
              child: Card(child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Expanded(  child: CachedNetworkImage( imageUrl: "${AppLinks.imagesItems}/${comingSearchItems[index].itemsImages}",)),
                  Expanded( flex: 3 , child: ListTile(title: Text("${comingSearchItems[index].itemsName}"),subtitle: Text("${comingSearchItems[index].categoriesName}") ,)),
                ],),
              ),),
            ),
          );
        });
  }
}
